-- Threat: !InfrastructureShared
-- Name: 5678cb7f0365
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
