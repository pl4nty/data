-- Threat: !InfrastructureShared
-- Name: 5978c00cdf9b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
