-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspShExecDrop.V
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: RPF:TopLevelFile & BM_SH_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, "/bin/", 1, true) == 1 or string.find(l_0_1, "/system/", 1, true) == 1 or string.find(l_0_1, "/sbin/", 1, true) == 1 or string.find(l_0_1, "/library/apple/", 1, true) == 1 or string.find(l_0_1, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_1, "/usr/", 1, true) == 1 and not string.find(l_0_1, "/usr/local/", 1, true) == 1 or string.find(l_0_1, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_4 = l_0_1 .. "/" .. l_0_2
local l_0_5 = {
  "launchd",
  "launchctl",
  "bash",
  "zsh",
  "wget",
  "curl",
  "xattr",
  "crontab",
  "configd",
  "syslog",
  "xpcproxy",
  "discord",
  "whoami",
  "security",
  "swift",
  "rsync",
  "hdiutil",
  "xpcservice"
}
for l_0_6, l_0_7 in pairs(l_0_5) do
  if l_0_2 == l_0_7 then
    mp.set_mpattribute("BM_MacMasquerading")
    if l_0_3 then
      MpCommon.BmTriggerSig(l_0_3, "BM_MacMasquerading", l_0_4)
      TrackPidAndTechnique(l_0_3, "T1036.005", "DefenseEvasion_Masquerading_ExecWitExactLegitName")
    end
    return mp.INFECTED
  end
  local l_0_8 = l_0_2:gsub("%W", "")
  if l_0_8 == l_0_7 then
    mp.set_mpattribute("BM_MacMasquerading")
    if l_0_3 then
      MpCommon.BmTriggerSig(l_0_3, "BM_MacMasquerading", l_0_4)
      TrackPidAndTechnique(l_0_3, "T1036.005", "DefenseEvasion_Masquerading_ExecWitExactLegitName")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
