-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/IoTSuite.C!dha
-- Type: 13
-- MpAttributes: (RPF:TopLevelFile & AGGR:IoTSuiteFDLorVDLFile)

if #mp.enum_mpattributesubstring("SCPT:IoTSuiteVDL") >= 5 or #mp.enum_mpattributesubstring("SCPT:IoTSuiteFDL") >= 7 then
  return mp.INFECTED
end
return mp.CLEAN
