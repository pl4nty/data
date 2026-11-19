-- Threat: !InfrastructureShared
-- Name: !#Lua:Linux/TaintHSTRAttributes.A
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: BM_ELF_FILE

local l_0_0 = mp.enum_mpattributesubstring("HSTR:Linux")
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = "enum_hstr_attributes"
AppendToRollingQueue(l_0_2, l_0_1, table.concat(l_0_0, "|"))
return mp.INFECTED
