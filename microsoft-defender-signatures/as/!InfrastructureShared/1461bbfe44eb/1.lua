-- Threat: !InfrastructureShared
-- Name: 1461bbfe44eb
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
