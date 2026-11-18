-- Threat: !InfrastructureShared
-- Name: !#Lua:BlockOpeningOfOfficeDroppedXOMLByCompiler.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "Lua:XOMLDroppedByOffice")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 ~= nil and string.lower(l_0_2) == "microsoft.workflow.compiler.exe" then
  return mp.INFECTED
end
return mp.CLEAN
