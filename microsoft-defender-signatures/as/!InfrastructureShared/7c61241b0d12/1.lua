-- Threat: !InfrastructureShared
-- Name: 7c61241b0d12
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 170000 then
  return mp.INFECTED
end
return mp.CLEAN
