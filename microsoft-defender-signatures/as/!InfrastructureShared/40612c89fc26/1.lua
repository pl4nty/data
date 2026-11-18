-- Threat: !InfrastructureShared
-- Name: 40612c89fc26
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
