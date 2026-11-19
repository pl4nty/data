-- Threat: !InfrastructureShared
-- Name: 3b78636d0d74
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
