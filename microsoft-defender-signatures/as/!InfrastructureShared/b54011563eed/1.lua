-- Threat: !InfrastructureShared
-- Name: b54011563eed
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
