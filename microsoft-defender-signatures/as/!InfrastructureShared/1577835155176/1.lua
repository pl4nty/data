-- Threat: !InfrastructureShared
-- Name: 1577835155176
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
