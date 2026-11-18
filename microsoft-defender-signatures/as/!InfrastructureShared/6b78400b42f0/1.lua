-- Threat: !InfrastructureShared
-- Name: 6b78400b42f0
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
