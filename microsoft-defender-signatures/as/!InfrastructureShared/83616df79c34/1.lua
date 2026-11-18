-- Threat: !InfrastructureShared
-- Name: 83616df79c34
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
