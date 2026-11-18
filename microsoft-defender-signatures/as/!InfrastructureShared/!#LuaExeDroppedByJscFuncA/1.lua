-- Threat: !InfrastructureShared
-- Name: !#Lua:ExeDroppedByJscFunc.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE or mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not string.find(l_0_0, "\\temp\\", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_0, "%.exe$") then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_1 ~= "jsc.exe" then
  return mp.CLEAN
end
local l_0_2 = MpCommon.QueryPersistContext(l_0_0, "Lua:ExeDroppedByJsc")
if l_0_2 then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
MpCommon.AppendPersistContext(l_0_0, "Lua:ExeDroppedByJsc", 0)
return mp.INFECTED
