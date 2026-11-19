-- Threat: !InfrastructureShared
-- Name: 8578b10e9950
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
