-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6b63_luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections == 10 and (pesecs[6]).Name == "43B" then
  return mp.INFECTED
end
return mp.CLEAN

