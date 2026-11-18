-- Threat: !InfrastructureShared
-- Name: 7278747df4f8
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
