-- Threat: !InfrastructureShared
-- Name: !#Lua:TriggerTaskResourceScan.A
-- Type: 13
-- MpAttributes: SCPT:SchTaskDefinitionFile & BM_XML_FILE & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if sysio.IsFileExists(l_0_0) then
  mp.TriggerScanResource("taskscheduler", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
