-- Threat: !InfrastructureShared
-- Name: 206b38008d24e
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = "%\\TimeProviders%\\+(.-)%\\"
local l_0_1 = bm.get_current_process_startup_info()
if isnull(l_0_1) or isnull(this_sigattrlog[3].utf8p1) or isnull(this_sigattrlog[3].utf8p2) or isnull(this_sigattrlog[2].utf8p1) or isnull(this_sigattrlog[4].utf8p1) or isnull(this_sigattrlog[5].utf8p1) then
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[2].utf8p2
local l_0_3 = this_sigattrlog[3].utf8p2
l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3)
if isnull(l_0_2) and l_0_4 == "c:\\windows\\system32\\w32time.dll" then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_3, false, true) then
  return mp.CLEAN
end
local l_0_5 = string.match(this_sigattrlog[2].utf8p1, l_0_0)
local l_0_6 = string.match(this_sigattrlog[3].utf8p1, l_0_0)
local l_0_7 = string.match(this_sigattrlog[4].utf8p1, l_0_0)
local l_0_8 = string.match(this_sigattrlog[5].utf8p1, l_0_0)
if isnull(l_0_5) or isnull(l_0_6) or isnull(l_0_7) or isnull(l_0_8) or l_0_5 ~= l_0_6 or l_0_6 ~= l_0_7 or l_0_6 ~= l_0_8 then
  return mp.CLEAN
end
if l_0_5 == "vmwTimeProvider" and l_0_4 == "c:\\program files\\vmware\\vmware tools\\vmwtimeprovider\\vmwtimeprovider.dll" then
  return mp.CLEAN
end
if l_0_4 == "c:\\windows\\system32\\sel_3390_time_provider.dll" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM(l_0_1.ppid, "T1547.003", "persist_timeprovider")
local l_0_9 = mp.GetParentProcInfo()
if l_0_9 and l_0_9.ppid then
  TrackPidAndTechniqueBM(l_0_9.ppid, "T1547.003", "persist_timeprovider")
  bm.add_threat_process(l_0_9.ppid)
end
bm.add_threat_file(l_0_3)
bm.add_related_string("TimeProvider", safeJsonSerialize({
  Parent = l_0_9.ppid,
  ProviderName = l_0_6,
  ProviderDLL = l_0_3,
  PreviousDLL = l_0_2 or "N/A"
}), bm.RelatedStringBMReport)
return mp.INFECTED
