-- Threat: !InfrastructureShared
-- Name: 6978b8785089
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 550000 then
  return mp.INFECTED
end
return mp.CLEAN
