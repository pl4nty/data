-- Threat: !InfrastructureShared
-- Name: 3678de5045f3
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
