-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8084_282.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections == 4 and (pesecs[4]).SizeOfRawData == 75776 and (pesecs[4]).PointerToRawData == 91648 then
  return mp.INFECTED
end
return mp.CLEAN

