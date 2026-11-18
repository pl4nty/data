-- Threat: !InfrastructureShared
-- Name: 10678e2ed41a0
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 265000 then
  return mp.INFECTED
end
return mp.CLEAN
