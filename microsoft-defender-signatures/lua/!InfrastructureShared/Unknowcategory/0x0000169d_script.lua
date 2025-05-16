-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000169d_luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections > 4 and pehdr.NumberOfSections < 16 and (pesecs[pehdr.NumberOfSections]).Name == ".jdata" and (pesecs[pehdr.NumberOfSections - 1]).Name == ".idata" and (pesecs[pehdr.NumberOfSections]).SizeOfRawData > 32768 and (pesecs[pehdr.NumberOfSections - 2]).Name == ".v-lizer" then
  return mp.INFECTED
end
return mp.CLEAN

