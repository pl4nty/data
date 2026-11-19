-- Threat: !InfrastructureShared
-- Name: ccb3b1a86073
-- Type: 21

local l_0_0 = MpCommon.PathToWin32Path(bm.get_imagepath())
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if 35 < #l_0_0 and string.sub(l_0_0, 1, 11) == "c:\\windows\\" and string.sub(l_0_0, -13) == "\\ddmsetup.exe" then
    return mp.CLEAN
  end
  if 110 < #l_0_0 and (string.sub(l_0_0, 1, 11) == "c:\\windows\\" or string.sub(l_0_0, 1, 47) == "c:\\programdata\\dell\\updateservice\\downloads\\") and string.find(l_0_0, "\\dell-command-update-", 1, true) then
    return mp.CLEAN
  end
  if 100 < #l_0_0 and (string.match(l_0_0, "^c:\\windows\\syswow64\\config\\systemprofile\\citrix\\updaterbinaries\\[^\\]+\\citrixreceiverupdater%.exe$") or string.find(l_0_0, "\\appdata\\local\\microsoft\\edgeupdate\\", 1, true) and string.find(l_0_0, "\\microsoftedgeupdatesetup.exe", 1, true) or string.find(l_0_0, ":\\programdata\\dell\\updateservice\\downloads\\", 1, true) and string.find(l_0_0, "\\dell-supportassist-os-recovery-plugin", 1, true)) then
    return mp.CLEAN
  end
  if 50 < #l_0_0 and (string.find(l_0_0, ":\\windows\\softwaredistribution\\download\\install\\microsoftedgestandaloneinstaller", 1, true) or string.find(l_0_0, ":\\progra~3\\lenovo\\system~1\\sessio~1\\reposi~1\\fhybd1~1\\fhybd1042_1_version.exe", 1, true) or string.find(l_0_0, ":\\programdata\\lenovo\\", 1, true) and string.find(l_0_0, "\\fhybd1042_1_version.exe", 1, true) or string.find(l_0_0, ":\\program files", 1, true) and string.find(l_0_0, "\\microsoft\\edgeupdate\\", 1, true) and string.find(l_0_0, "\\microsoftedgeupdatesetup", 1, true) or string.find(l_0_0, "\\citrix\\ica client\\receiver\\updaterservice.exe", 1, true) or string.find(l_0_0, ":\\windows\temp\\", 1, true) and string.find(l_0_0, "\\tbt_dock_firmware\\getdockver32w.exe", 1, true) or string.find(l_0_0, ":\\programdata\\lenovo\\systemupdate\\", 1, true) and string.find(l_0_0, "\\devcon.exe", 1, true) or string.find(l_0_0, ":\\windows\\temp\\dellcabdownloads\\dellcabextract\\dell-command-update-application", 1, true) or string.find(l_0_0, ":\\programdata\\lexcom\\etka\\userdata\\slavea\\va\\notesuploader.exe", 1, true) or string.find(l_0_0, ":\\program files", 1, true) and string.find(l_0_0, "\\qualys\\qualysagent\\qualysagent.exe", 1, true)) then
    return mp.CLEAN
  end
end
local l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p1
end
if l_0_1 == nil or #l_0_1 <= 4 then
  return mp.CLEAN
end

local function l_0_2(l_1_0)
  return l_1_0:match("^(.*)[/\\][^/\\]+$")
end

local function l_0_3(l_2_0)
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

local l_0_4 = l_0_2(string.lower(l_0_1))
if l_0_4 == nil or #l_0_4 <= 2 then
  return mp.CLEAN
end
local l_0_5 = l_0_3(l_0_1)
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = false
if l_0_0 ~= nil then
  l_0_6 = mp.IsKnownFriendlyFile(l_0_0, true, false)
end
local l_0_7 = false
for l_0_8 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_8].matched and sigattr_head[l_0_8].attribute == 16384 then
    local l_0_9 = sigattr_head[l_0_8].utf8p1
    if l_0_9 ~= nil and 4 <= #l_0_9 then
      local l_0_10 = string.lower(l_0_9)
      if string.sub(l_0_10, -4) == ".dll" then
        local l_0_11 = l_0_2(l_0_10)
        if l_0_4 == l_0_11 and mp.IsKnownFriendlyFile(l_0_9, true, false) ~= true then
          if l_0_6 == true then
            MpCommon.BmTriggerSig(l_0_5, "PossibleDllHijackExecFlowA_FriendlyDropper", l_0_9)
          else
            MpCommon.BmTriggerSig(l_0_5, "PossibleDllHijackExecFlowA_UnfriendlyDropper", l_0_9)
          end
          l_0_7 = true
          local l_0_12 = l_0_9:match("([^/\\]+)$")
          if l_0_12 ~= nil and 4 <= #l_0_12 then
            local l_0_13 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\" .. l_0_12)
            local l_0_14 = MpCommon.ExpandEnvironmentVariables("%windir%\\syswow64\\" .. l_0_12)
            if l_0_13 ~= nil and sysio.IsFileExists(l_0_13) or l_0_14 ~= nil and sysio.IsFileExists(l_0_14) then
              if l_0_6 == true then
                MpCommon.BmTriggerSig(l_0_5, "PossibleDllHijackExecFlowB_FriendlyDropper", l_0_9)
              else
                MpCommon.BmTriggerSig(l_0_5, "PossibleDllHijackExecFlowB_UnfriendlyDropper", l_0_9)
              end
            end
          end
        end
      end
    end
  end
end
if l_0_7 then
  return mp.INFECTED
end
return mp.CLEAN
