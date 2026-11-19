-- Threat: !InfrastructureShared
-- Name: 6e78de9be4c3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
