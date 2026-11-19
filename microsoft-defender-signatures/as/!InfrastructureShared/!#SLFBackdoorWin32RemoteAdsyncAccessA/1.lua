-- Threat: !InfrastructureShared
-- Name: !#SLF:Backdoor:Win32/RemoteAdsyncAccess.A
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & MpOnOpenRtpScan & Lua:MDFExt

if mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID) ~= 4 then
  return mp.CLEAN
end
if not IsADConnectRole() then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH))
if l_0_0:find("\\Data\\ADSync2019", 1, true) and l_0_1 == "ADSync.mdf" then
  local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_IP)
  if not (l_0_2 and l_0_3) or l_0_3 == "" then
    return mp.CLEAN
  end
  mp.set_mpattribute(string.format("MpInternal_researchdata=RemoteAdsyncAccess=%s", l_0_3))
  return mp.INFECTED
end
return mp.CLEAN
