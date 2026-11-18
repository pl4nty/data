-- Threat: !InfrastructureShared
-- Name: 46785d86e8b3
-- Type: 21

if peattributes.epscn_islast and pehdr.NumberOfSections >= 2 and peattributes.hasstandardentry ~= 1 then
  return mp.INFECTED
end
return mp.CLEAN
