-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaLinuxTaintHSTRAttributesA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("HSTR:Linux")
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = "enum_hstr_attributes"
AppendToRollingQueue(l_0_2, l_0_1, (table.concat)(l_0_0, "|"))
return mp.INFECTED

