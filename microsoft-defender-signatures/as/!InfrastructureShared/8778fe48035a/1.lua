-- Threat: !InfrastructureShared
-- Name: 8778fe48035a
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
