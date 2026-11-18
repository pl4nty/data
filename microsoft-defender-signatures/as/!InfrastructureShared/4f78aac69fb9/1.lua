-- Threat: !InfrastructureShared
-- Name: 4f78aac69fb9
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 150000 and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
