-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6c9a_234.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if (string.find)(l_0_0, "xl/drawings/_rels/drawing1.xml.rels") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

