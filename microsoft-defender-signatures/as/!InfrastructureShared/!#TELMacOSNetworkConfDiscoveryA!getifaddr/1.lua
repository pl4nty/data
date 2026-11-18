-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/NetworkConfDiscovery.A!getifaddr
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: (RPF:TopLevelFile & SCPT:PYGETIFADDR)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 5 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 then
  TrackPidAndTechnique(l_0_1, "T1016", "Discovery_NetworkConfDiscovery_Getifaddr")
  MpCommon.BmTriggerSig(l_0_1, "BM_PYGETIFADDR", l_0_0)
end
return mp.INFECTED
