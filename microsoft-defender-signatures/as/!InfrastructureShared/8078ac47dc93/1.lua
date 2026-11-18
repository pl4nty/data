-- Threat: !InfrastructureShared
-- Name: 8078ac47dc93
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 5500000 then
  return mp.INFECTED
end
return mp.CLEAN
