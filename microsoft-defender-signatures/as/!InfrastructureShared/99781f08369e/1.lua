-- Threat: !InfrastructureShared
-- Name: 99781f08369e
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
