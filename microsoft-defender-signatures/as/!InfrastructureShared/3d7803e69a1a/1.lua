-- Threat: !InfrastructureShared
-- Name: 3d7803e69a1a
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
