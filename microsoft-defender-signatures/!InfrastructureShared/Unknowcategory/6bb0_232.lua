-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6bb0_232.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("PACKED_WITH:[MSILRES:_]") and (mp.get_mpattribute)("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN

