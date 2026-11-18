-- Threat: !InfrastructureShared
-- Name: 9978c62587ca
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
