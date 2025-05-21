-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\746f_258.luac 

-- params : ...
-- function num : 0
if peattributes.isexe == true and peattributes.ismsil == true and (mp.get_mpattribute)("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN

