-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9c12_369.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections == 4 and (pesecs[pehdr.NumberOfSections]).Name == "" and (pesecs[pehdr.NumberOfSections]).SizeOfRawData == 0 and (mp.bitand)((pesecs[pehdr.NumberOfSections]).Characteristics, 3758096384) == 3758096384 then
  return mp.INFECTED
end
return mp.CLEAN

