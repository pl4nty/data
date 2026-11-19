-- Threat: !InfrastructureShared
-- Name: 8d785b4d8820
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 400000 then
  return mp.INFECTED
end
return mp.CLEAN
