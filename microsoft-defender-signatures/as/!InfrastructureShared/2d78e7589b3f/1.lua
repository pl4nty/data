-- Threat: !InfrastructureShared
-- Name: 2d78e7589b3f
-- Type: 21

if peattributes.x86_image and pesecs[pehdr.NumberOfSections].Name == ".htext" and pesecs[pehdr.NumberOfSections].Characteristics == 3758096480 and (pesecs[pehdr.NumberOfSections - 1].Characteristics == 3758096448 or pesecs[pehdr.NumberOfSections - 1].Characteristics == 3791650880) then
  return mp.INFECTED
end
return mp.CLEAN
