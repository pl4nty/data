-- Threat: !InfrastructureShared
-- Name: 83788eab5b3d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
