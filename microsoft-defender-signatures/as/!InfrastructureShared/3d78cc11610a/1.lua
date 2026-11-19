-- Threat: !InfrastructureShared
-- Name: 3d78cc11610a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
