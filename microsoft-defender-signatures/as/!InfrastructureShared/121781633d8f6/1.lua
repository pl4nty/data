-- Threat: !InfrastructureShared
-- Name: 121781633d8f6
-- Type: 21

if pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
