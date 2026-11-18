-- Threat: !InfrastructureShared
-- Name: 9778c3118b80
-- Type: 21

if mp.getfilesize() > 300000 then
  return mp.CLEAN
end
return mp.INFECTED
