-- Threat: !InfrastructureShared
-- Name: 317899a0591d
-- Type: 21

if pehdr.NumberOfSections == 18 then
  return mp.INFECTED
end
return mp.CLEAN
