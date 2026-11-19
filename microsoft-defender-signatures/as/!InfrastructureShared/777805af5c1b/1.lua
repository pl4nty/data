-- Threat: !InfrastructureShared
-- Name: 777805af5c1b
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
