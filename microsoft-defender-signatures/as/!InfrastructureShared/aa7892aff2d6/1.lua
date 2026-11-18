-- Threat: !InfrastructureShared
-- Name: aa7892aff2d6
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
