-- Threat: !InfrastructureShared
-- Name: 7f7835b8f136
-- Type: 21

if mp.getfilesize() >= 1000000 and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
