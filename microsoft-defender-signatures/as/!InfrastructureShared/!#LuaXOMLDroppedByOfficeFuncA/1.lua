-- Threat: !InfrastructureShared
-- Name: !#Lua:XOMLDroppedByOfficeFunc.A
-- Type: 13
-- Includes: HipsLuaInfra
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "Lua:XOMLDroppedByOffice")
if l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.sub(l_0_0, -5):match("%.(%w+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2 ~= "xoml" then
  return mp.CLEAN
end
local l_0_3 = GetCtxOfficeProc()
if l_0_3 == "" then
  return mp.CLEAN
end
mp.set_mpattribute("MpDisableCaching")
MpCommon.AppendPersistContext(l_0_0, "Lua:XOMLDroppedByOffice", 0)
return mp.INFECTED
