-- Threat: !InfrastructureShared
-- Name: b66b33d92132f
-- Type: 21

local function l_0_0(l_1_0)
  return l_1_0:match("^(.*)[/\\][^/\\]+$")
end

function GetChildPpidByImagePath(l_2_0)
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

local l_0_1 = MpCommon.PathToWin32Path(bm.get_imagepath())
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
  if 35 < #l_0_1 and string.sub(l_0_1, 1, 11) == "c:\\windows\\" and string.sub(l_0_1, -13) == "\\ddmsetup.exe" then
    return mp.CLEAN
  end
  if 110 < #l_0_1 and (string.sub(l_0_1, 1, 11) == "c:\\windows\\" or string.sub(l_0_1, 1, 47) == "c:\\programdata\\dell\\updateservice\\downloads\\") and string.find(l_0_1, "\\dell-command-update-", 1, true) then
    return mp.CLEAN
  end
  if 100 < #l_0_1 and (string.match(l_0_1, "^c:\\windows\\syswow64\\config\\systemprofile\\citrix\\updaterbinaries\\[^\\]+\\citrixreceiverupdater%.exe$") or string.find(l_0_1, "\\appdata\\local\\microsoft\\edgeupdate\\", 1, true) and string.find(l_0_1, "\\microsoftedgeupdatesetup.exe", 1, true) or string.find(l_0_1, ":\\programdata\\dell\\updateservice\\downloads\\", 1, true) and string.find(l_0_1, "\\dell-supportassist-os-recovery-plugin", 1, true)) then
    return mp.CLEAN
  end
  if 50 < #l_0_1 and (string.find(l_0_1, ":\\windows\\softwaredistribution\\download\\install\\microsoftedgestandaloneinstaller", 1, true) or string.find(l_0_1, ":\\progra~3\\lenovo\\system~1\\sessio~1\\reposi~1\\fhybd1~1\\fhybd1042_1_version.exe", 1, true) or string.find(l_0_1, ":\\programdata\\lenovo\\", 1, true) and string.find(l_0_1, "\\fhybd1042_1_version.exe", 1, true) or string.find(l_0_1, ":\\program files", 1, true) and string.find(l_0_1, "\\microsoft\\edgeupdate\\", 1, true) and string.find(l_0_1, "\\microsoftedgeupdatesetup", 1, true) or string.find(l_0_1, "\\citrix\\ica client\\receiver\\updaterservice.exe", 1, true) or string.find(l_0_1, ":\\windows\temp\\", 1, true) and string.find(l_0_1, "\\tbt_dock_firmware\\getdockver32w.exe", 1, true) or string.find(l_0_1, ":\\programdata\\lenovo\\systemupdate\\", 1, true) and string.find(l_0_1, "\\devcon.exe", 1, true) or string.find(l_0_1, ":\\windows\\temp\\dellcabdownloads\\dellcabextract\\dell-command-update-application", 1, true) or string.find(l_0_1, ":\\programdata\\lexcom\\etka\\userdata\\slavea\\va\\notesuploader.exe", 1, true) or string.find(l_0_1, ":\\program files", 1, true) and string.find(l_0_1, "\\qualys\\qualysagent\\qualysagent.exe", 1, true)) then
    return mp.CLEAN
  end
end
local l_0_2
if this_sigattrlog[32].matched and this_sigattrlog[32].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[32].utf8p1
end
if l_0_2 == nil or #l_0_2 <= 4 then
  return mp.CLEAN
end
local l_0_3 = l_0_0(string.lower(l_0_2))
if l_0_3 == nil or #l_0_3 <= 2 then
  return mp.CLEAN
end
local l_0_4 = GetChildPpidByImagePath(l_0_2)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = false
if l_0_1 ~= nil then
  l_0_5 = mp.IsKnownFriendlyFile(l_0_1, true, false)
end
local l_0_6 = false
for l_0_7 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_7].matched and sigattr_head[l_0_7].attribute == 16384 then
    local l_0_8 = sigattr_head[l_0_7].utf8p1
    if l_0_8 ~= nil and 4 <= #l_0_8 then
      local l_0_9 = string.lower(l_0_8)
      if string.sub(l_0_9, -4) == ".dll" then
        local l_0_10 = l_0_0(l_0_9)
        if l_0_3 == l_0_10 and mp.IsKnownFriendlyFile(l_0_8, true, false) ~= true then
          if l_0_5 == true then
            MpCommon.BmTriggerSig(l_0_4, "PossibleDllHijackExecFlowA_FriendlyDropper", l_0_8)
          else
            MpCommon.BmTriggerSig(l_0_4, "PossibleDllHijackExecFlowA_UnfriendlyDropper", l_0_8)
          end
          l_0_6 = true
          bm.add_related_file(l_0_2)
          bm.add_related_file(l_0_8)
          local l_0_11 = l_0_8:match("([^/\\]+)$")
          if l_0_11 ~= nil and 4 <= #l_0_11 then
            local l_0_12 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\" .. l_0_11)
            local l_0_13 = MpCommon.ExpandEnvironmentVariables("%windir%\\syswow64\\" .. l_0_11)
            if l_0_12 ~= nil and sysio.IsFileExists(l_0_12) or l_0_13 ~= nil and sysio.IsFileExists(l_0_13) then
              if l_0_5 == true then
                MpCommon.BmTriggerSig(l_0_4, "PossibleDllHijackExecFlowB_FriendlyDropper", l_0_8)
              else
                MpCommon.BmTriggerSig(l_0_4, "PossibleDllHijackExecFlowB_UnfriendlyDropper", l_0_8)
              end
            end
          end
        end
      end
    end
  end
end
if l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
