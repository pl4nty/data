-- Threat: !InfrastructureShared
-- Name: 58783f55b4fe
-- Type: 21

if mp.getfilesize() > 409600 then
  return mp.CLEAN
end
return mp.INFECTED
