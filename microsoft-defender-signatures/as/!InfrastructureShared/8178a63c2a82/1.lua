-- Threat: !InfrastructureShared
-- Name: 8178a63c2a82
-- Type: 21

if pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
