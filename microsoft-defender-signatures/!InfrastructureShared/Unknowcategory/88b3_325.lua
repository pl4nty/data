-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\88b3_325.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() < 1024000 and pehdr.NumberOfSections == 3 and peattributes.ismsil == true and (mp.get_mpattribute)("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN

