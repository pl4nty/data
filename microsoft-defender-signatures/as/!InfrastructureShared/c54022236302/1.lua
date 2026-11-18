-- Threat: !InfrastructureShared
-- Name: c54022236302
-- Type: 21

if pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
