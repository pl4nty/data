-- Threat: !InfrastructureShared
-- Name: d678d46e7d51
-- Type: 21

if mp.getfilesize() >= 65536 and mp.getfilesize() < 131072 then
  return mp.INFECTED
end
return mp.CLEAN
