-- Threat: !InfrastructureShared
-- Name: 10c8f938b4cd8
-- Type: 21

if mp.getfilesize() < 150000 then
  return mp.INFECTED
end
return mp.CLEAN
