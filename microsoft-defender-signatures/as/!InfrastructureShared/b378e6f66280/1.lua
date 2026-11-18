-- Threat: !InfrastructureShared
-- Name: b378e6f66280
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
