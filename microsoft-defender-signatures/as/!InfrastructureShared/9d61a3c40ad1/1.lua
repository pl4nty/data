-- Threat: !InfrastructureShared
-- Name: 9d61a3c40ad1
-- Type: 21

if mp.getfilesize() > 7000 then
  return mp.INFECTED
end
return mp.CLEAN
