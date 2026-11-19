-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/ProcessDiscovery.C!listpids
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: (RPF:TopLevelFile & SCPT:Py_Process_Discovery_1)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 5 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 then
  TrackPidAndTechnique(l_0_1, "T1057", "Discovery_ProcessDiscovery_list_pids")
end
return mp.INFECTED
