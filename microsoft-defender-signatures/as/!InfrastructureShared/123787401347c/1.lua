-- Threat: !InfrastructureShared
-- Name: 123787401347c
-- Type: 21

if mp.getfilesize() > 60000 then
  return mp.INFECTED
end
return mp.CLEAN
