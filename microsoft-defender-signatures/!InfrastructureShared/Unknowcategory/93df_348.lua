-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93df_348.luac 

-- params : ...
-- function num : 0
if peattributes.hasappendeddata and (mp.getfilesize)() - ((pesecs[pehdr.NumberOfSections]).PointerToRawData + (pesecs[pehdr.NumberOfSections]).SizeOfRawData) > 65536 then
  return mp.INFECTED
end
return mp.LOWFI

