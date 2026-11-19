-- Threat: !InfrastructureShared
-- Name: c378fa318a79
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
