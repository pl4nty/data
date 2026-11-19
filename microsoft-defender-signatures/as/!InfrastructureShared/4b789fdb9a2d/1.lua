-- Threat: !InfrastructureShared
-- Name: 4b789fdb9a2d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
