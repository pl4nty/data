-- Threat: !InfrastructureShared
-- Name: 6878b8d55824
-- Type: 21

if pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
