-- Threat: !InfrastructureShared
-- Name: 80782e65da8d
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
