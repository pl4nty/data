-- Threat: !InfrastructureShared
-- Name: 6a7839c9990a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
