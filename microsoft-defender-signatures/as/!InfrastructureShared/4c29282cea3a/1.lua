-- Threat: !InfrastructureShared
-- Name: 4c29282cea3a
-- Type: 21

if mp.getfilesize() <= 512 then
  return mp.INFECTED
else
  return mp.LOWFI
end
return mp.CLEAN
