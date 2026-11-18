-- Threat: !InfrastructureShared
-- Name: c9789db865e0
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 300000 and mp.getfilesize() < 380000 then
  return mp.INFECTED
end
return mp.CLEAN
