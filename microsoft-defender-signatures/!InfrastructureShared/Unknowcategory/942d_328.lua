-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\942d_328.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.getfilename)(mp.FILEPATH_QUERY_FNAME))
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0:sub(-4)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2.aspx = mp.INFECTED
if l_0_2[l_0_1] == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN

