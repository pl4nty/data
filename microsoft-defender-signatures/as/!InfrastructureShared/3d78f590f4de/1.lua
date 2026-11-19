-- Threat: !InfrastructureShared
-- Name: 3d78f590f4de
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
