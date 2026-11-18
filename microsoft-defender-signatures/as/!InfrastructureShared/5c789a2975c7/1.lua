-- Threat: !InfrastructureShared
-- Name: 5c789a2975c7
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
