-- Threat: !InfrastructureShared
-- Name: 54780e19ab4d
-- Type: 21

if mp.getfilesize() < 13000 then
  return mp.INFECTED
end
return mp.CLEAN
