-- Threat: !InfrastructureShared
-- Name: 35b3b8690228
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = bm.get_imagepath()
local l_0_3
if l_0_2 ~= nil then
  local l_0_4 = {
    ["rpcnetp.exe"] = true,
    ["rpcnet.exe"] = true,
    ["services.exe"] = true,
    ["msmpeng.exe"] = true
  }
  local l_0_5 = string.lower(string.sub(l_0_2, -30)):match("\\system32\\([^\\]+%.exe)$")
  if l_0_4[l_0_5] then
    return mp.CLEAN
  end
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  l_0_1 = l_0_0:match("(.+)\\svchost%.exe")
  l_0_1 = MpCommon.PathToWin32Path(l_0_1)
  l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
  if l_0_1 ~= nil then
    if l_0_1:match("\\windows\\system32") or l_0_1:match("\\windows\\syswow64") then
      return mp.CLEAN
    else
      if l_0_3 ~= nil then
        local l_0_6 = mp.GetExecutablesFromCommandLine(l_0_3)
        for l_0_7, l_0_8 in ipairs(l_0_6) do
          l_0_8 = mp.ContextualExpandEnvironmentVariables(l_0_8)
          if sysio.IsFileExists(l_0_8) == true then
            bm.add_related_file(l_0_8)
          end
        end
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
