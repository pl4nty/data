-- Threat: !InfrastructureShared
-- Name: 10db330767eff
-- Type: 21

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if l_0_0 == nil or #l_0_0 <= 4 then
  return mp.CLEAN
end

function getDirectoryPath(l_1_0)
  return l_1_0:match("^(.*)[/\\][^/\\]+$")
end

local function l_0_1(l_2_0)
  if l_2_0 == nil then
    return
  end
  local l_2_1, l_2_2 = bm.get_process_relationships()
  for l_2_3, l_2_4 in ipairs(l_2_2) do
    if mp.bitand(l_2_4.reason_ex, 1) == 1 then
      local l_2_5 = l_2_4.image_path
      if l_2_5 ~= nil then
        l_2_5 = MpCommon.PathToWin32Path(l_2_5)
        if string.lower(l_2_5) == string.lower(l_2_0) then
          return l_2_4.ppid
        end
      end
    end
  end
  return
end

local l_0_2 = getDirectoryPath(string.lower(l_0_0))
if l_0_2 == nil or #l_0_2 <= 2 then
  return mp.CLEAN
end
local l_0_3 = l_0_1(l_0_0)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = false
for l_0_5 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_5].matched and sigattr_head[l_0_5].attribute == 16386 then
    local l_0_6 = sigattr_head[l_0_5].utf8p1
    if l_0_6 ~= nil and 4 <= #l_0_6 then
      local l_0_7 = string.lower(l_0_6)
      if string.sub(l_0_7, -4) == ".dll" then
        local l_0_8 = getDirectoryPath(l_0_7)
        if l_0_2 == l_0_8 and mp.IsKnownFriendlyFile(l_0_6, true, false) ~= true then
          MpCommon.BmTriggerSig(l_0_3, "PossibleDllHijackExecFlowRenameA", l_0_6)
          l_0_4 = true
          local l_0_9 = l_0_6:match("([^/\\]+)$")
          if l_0_9 ~= nil and 4 <= #l_0_9 then
            local l_0_10 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\" .. l_0_9)
            local l_0_11 = MpCommon.ExpandEnvironmentVariables("%windir%\\syswow64\\" .. l_0_9)
            if l_0_10 ~= nil and sysio.IsFileExists(l_0_10) or l_0_11 ~= nil and sysio.IsFileExists(l_0_11) then
              MpCommon.BmTriggerSig(l_0_3, "PossibleDllHijackExecFlowRenameB", l_0_6)
            end
          end
        end
      end
    end
  end
end
if l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
