-- Threat: !InfrastructureShared
-- Name: 2929b9148b48
-- Type: 21

if mp.getfilesize() <= 10240 and mp.getfilesize() >= 5120 then
  return mp.INFECTED
end
return mp.CLEAN
