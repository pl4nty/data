-- Threat: !InfrastructureShared
-- Name: ba7847b51df4
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
