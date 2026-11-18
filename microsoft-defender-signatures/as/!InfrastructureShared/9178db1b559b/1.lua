-- Threat: !InfrastructureShared
-- Name: 9178db1b559b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
