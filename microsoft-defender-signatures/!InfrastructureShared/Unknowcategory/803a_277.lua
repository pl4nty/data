-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\803a_277.luac 

-- params : ...
-- function num : 0
if peattributes.ismsil == true and (mp.get_mpattribute)("pea_headerchecksum0") and (mp.getfilesize)() >= 100000 then
  return mp.INFECTED
end
return mp.CLEAN

