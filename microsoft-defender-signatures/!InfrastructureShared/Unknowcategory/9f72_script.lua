-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9f72_luac 

-- params : ...
-- function num : 0
if peattributes.x86_image and (pesecs[pehdr.NumberOfSections]).Name == ".htext" and (pesecs[pehdr.NumberOfSections]).Characteristics == 3758096480 and ((pesecs[pehdr.NumberOfSections - 1]).Characteristics == 3758096448 or (pesecs[pehdr.NumberOfSections - 1]).Characteristics == 3791650880) then
  return mp.INFECTED
end
return mp.CLEAN

