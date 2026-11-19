-- Threat: !InfrastructureShared
-- Name: 3d8973c34766
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
