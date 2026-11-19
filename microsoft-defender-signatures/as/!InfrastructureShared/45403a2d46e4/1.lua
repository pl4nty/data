-- Threat: !InfrastructureShared
-- Name: 45403a2d46e4
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
