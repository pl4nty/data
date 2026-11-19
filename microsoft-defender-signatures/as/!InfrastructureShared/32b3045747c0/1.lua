-- Threat: !InfrastructureShared
-- Name: 32b3045747c0
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if l_0_1 then
  local l_0_2 = mp.ContextualExpandEnvironmentVariables("%localappdata%")
  local l_0_3 = sysio.GetFsOwnerSidString(l_0_2)
  local l_0_4 = 1
  local l_0_5 = sysio.RegExpandUserKey("HKCU\\Software")
  if l_0_5 then
    for l_0_6, l_0_7 in pairs(l_0_5) do
      if 23 < #l_0_7 and not string.find(l_0_7, "-5..\\", -13) and not string.find(l_0_7, l_0_3, 6, true) then
        l_0_4 = l_0_4 + 1
        break
      end
    end
  end
  if 1 < l_0_4 then
    local l_0_8 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion"
    local l_0_9 = sysio.RegOpenKey(l_0_8)
    if l_0_9 then
      local l_0_10 = sysio.GetRegValueAsDword(l_0_9, "InstallDate")
      if not l_0_10 then
        l_0_10 = sysio.GetRegValueAsDword(l_0_9, "InstallTime")
        l_0_10 = l_0_10 and l_0_10 / 10000000 - 11644473600
      end
      if l_0_10 then
        local l_0_11 = MpCommon.GetCurrentTimeT()
        if l_0_10 > l_0_11 or 86400 < l_0_11 - l_0_10 then
          local l_0_12 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSUserName)
          MpCommon.AppendPersistContextNoPath("MpNewRemoteUsers", l_0_12, 43200)
        end
      end
    end
  end
end
return mp.CLEAN
