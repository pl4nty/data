-- Threat: !InfrastructureShared
-- Name: 7278dabbb3f5
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
