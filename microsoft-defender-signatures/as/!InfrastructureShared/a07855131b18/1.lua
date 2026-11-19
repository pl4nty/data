-- Threat: !InfrastructureShared
-- Name: a07855131b18
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
