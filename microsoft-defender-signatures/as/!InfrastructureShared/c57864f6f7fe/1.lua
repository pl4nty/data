-- Threat: !InfrastructureShared
-- Name: c57864f6f7fe
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
