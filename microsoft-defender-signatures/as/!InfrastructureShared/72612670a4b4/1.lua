-- Threat: !InfrastructureShared
-- Name: 72612670a4b4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
