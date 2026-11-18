-- Threat: !InfrastructureShared
-- Name: 637835463c6e
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
