-- Threat: !InfrastructureShared
-- Name: 5b7887265d52
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
