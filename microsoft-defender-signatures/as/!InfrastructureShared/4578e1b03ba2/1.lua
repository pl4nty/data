-- Threat: !InfrastructureShared
-- Name: 4578e1b03ba2
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
