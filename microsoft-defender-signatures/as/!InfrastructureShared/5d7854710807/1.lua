-- Threat: !InfrastructureShared
-- Name: 5d7854710807
-- Type: 21

if mp.HSTR_WEIGHT >= 1 and pehdr.Subsystem ~= 1 then
  return mp.INFECTED
end
return mp.CLEAN
