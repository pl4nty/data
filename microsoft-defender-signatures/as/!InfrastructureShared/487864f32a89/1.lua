-- Threat: !InfrastructureShared
-- Name: 487864f32a89
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
