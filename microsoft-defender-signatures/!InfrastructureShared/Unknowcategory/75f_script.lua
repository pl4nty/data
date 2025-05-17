-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\75f_luac 

-- params : ...
-- function num : 0
if (pesecs[pehdr.NumberOfSections]).SizeOfRawData > 2 then
  return mp.CLEAN
end
if (mp.getfilesize)() >= 400000 then
  (mp.set_mpattribute)("AutoItIgnoreMaxSizes")
end
return mp.INFECTED

