-- Threat: !InfrastructureShared
-- Name: 22617fb804de
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
