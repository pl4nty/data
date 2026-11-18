-- Threat: !InfrastructureShared
-- Name: 2178ff5e8194
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
