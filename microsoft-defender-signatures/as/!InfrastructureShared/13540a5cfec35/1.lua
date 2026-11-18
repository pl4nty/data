-- Threat: !InfrastructureShared
-- Name: 13540a5cfec35
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
