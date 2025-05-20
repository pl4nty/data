-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\806c_281.luac 

-- params : ...
-- function num : 0
if (peattributes.isexe == true or peattributes.ismsil == true) and pehdr.SizeOfImage >= 57344 and pehdr.Subsystem == 2 then
  return mp.INFECTED
end
return mp.CLEAN

