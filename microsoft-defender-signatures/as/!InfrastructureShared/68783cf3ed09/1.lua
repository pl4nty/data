-- Threat: !InfrastructureShared
-- Name: 68783cf3ed09
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
