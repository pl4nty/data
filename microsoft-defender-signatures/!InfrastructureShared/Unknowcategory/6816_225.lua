-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6816_225.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections == 5 and (pesecs[5]).Name == ".idata" then
  return mp.INFECTED
end
return mp.CLEAN

