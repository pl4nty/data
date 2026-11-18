-- Threat: !InfrastructureShared
-- Name: 4b7803a6e298
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
