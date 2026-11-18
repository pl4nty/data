-- Threat: !InfrastructureShared
-- Name: 2a29000def4a
-- Type: 21

if mp.getfilesize() <= 512 then
  return mp.INFECTED
else
  return mp.LOWFI
end
return mp.CLEAN
