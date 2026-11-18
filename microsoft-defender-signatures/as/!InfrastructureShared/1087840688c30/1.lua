-- Threat: !InfrastructureShared
-- Name: 1087840688c30
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
