-- Threat: !InfrastructureShared
-- Name: bb78190e0062
-- Type: 21

if mp.getfilesize() < 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
