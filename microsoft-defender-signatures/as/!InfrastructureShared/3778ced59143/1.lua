-- Threat: !InfrastructureShared
-- Name: 3778ced59143
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
