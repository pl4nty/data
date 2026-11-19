-- Threat: !InfrastructureShared
-- Name: 307834dfd966
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
