-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaLinuxTaintBMAttri\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 > 31457280 then
  return mp.CLEAN
end
local l_0_1 = (mp.enum_mpattributesubstring)("BM")
if l_0_1 == nil or #l_0_1 < 1 then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = "enum_bm_attributes"
AppendToRollingQueue(l_0_3, l_0_2, (table.concat)(l_0_1, "|"))
return mp.INFECTED

