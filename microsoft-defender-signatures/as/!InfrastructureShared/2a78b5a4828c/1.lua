-- Threat: !InfrastructureShared
-- Name: 2a78b5a4828c
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
