-- Threat: !InfrastructureShared
-- Name: 2a7855a9f7e1
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
