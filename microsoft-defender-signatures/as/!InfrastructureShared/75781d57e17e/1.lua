-- Threat: !InfrastructureShared
-- Name: 75781d57e17e
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
