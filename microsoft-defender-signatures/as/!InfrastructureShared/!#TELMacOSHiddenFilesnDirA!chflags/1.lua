-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/HiddenFilesnDir.A!chflags
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: (RPF:TopLevelFile & SCPT:Chflags)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 5 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 then
  TrackPidAndTechnique(l_0_1, "T1564.001", "DefenseEvasion_HideArtifacts_chflagsAPI")
end
return mp.INFECTED
