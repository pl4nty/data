-- Threat: !InfrastructureShared
-- Name: dc785c3b229e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
