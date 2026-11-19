-- Threat: !InfrastructureShared
-- Name: 77786ddffea1
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
