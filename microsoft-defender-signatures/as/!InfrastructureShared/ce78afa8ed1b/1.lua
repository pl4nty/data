-- Threat: !InfrastructureShared
-- Name: ce78afa8ed1b
-- Type: 21

if pehdr.NumberOfSections == 9 then
  return mp.INFECTED
end
return mp.CLEAN
