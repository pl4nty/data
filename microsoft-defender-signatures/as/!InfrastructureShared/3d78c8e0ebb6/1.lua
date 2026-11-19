-- Threat: !InfrastructureShared
-- Name: 3d78c8e0ebb6
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
