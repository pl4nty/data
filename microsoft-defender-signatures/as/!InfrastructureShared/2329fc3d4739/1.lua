-- Threat: !InfrastructureShared
-- Name: 2329fc3d4739
-- Type: 21

if mp.getfilesize() <= 80 then
  return mp.INFECTED
else
  return mp.LOWFI
end
return mp.CLEAN
