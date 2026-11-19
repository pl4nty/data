-- Threat: !InfrastructureShared
-- Name: 407890e4ad42
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
