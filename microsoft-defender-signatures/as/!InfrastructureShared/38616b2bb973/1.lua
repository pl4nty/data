-- Threat: !InfrastructureShared
-- Name: 38616b2bb973
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
