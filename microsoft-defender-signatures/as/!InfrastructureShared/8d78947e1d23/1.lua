-- Threat: !InfrastructureShared
-- Name: 8d78947e1d23
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
