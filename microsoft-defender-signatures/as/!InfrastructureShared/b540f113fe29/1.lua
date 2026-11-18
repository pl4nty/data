-- Threat: !InfrastructureShared
-- Name: b540f113fe29
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
