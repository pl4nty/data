-- Threat: !InfrastructureShared
-- Name: 9a78dd2cc863
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
