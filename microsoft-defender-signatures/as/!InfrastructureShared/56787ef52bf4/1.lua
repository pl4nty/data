-- Threat: !InfrastructureShared
-- Name: 56787ef52bf4
-- Type: 21

if mp.getfilesize() < 800000 then
  return mp.INFECTED
end
return mp.CLEAN
