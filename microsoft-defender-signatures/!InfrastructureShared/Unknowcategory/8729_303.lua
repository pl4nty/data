-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8729_303.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() == 47576 and peattributes.no_security == true and peattributes.isexe == true and (pesecs[4]).Name == ".ex_rsc" then
  return mp.INFECTED
end
return mp.CLEAN

