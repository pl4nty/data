-- Threat: !InfrastructureShared
-- Name: 4978d1c21128
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
