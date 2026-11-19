-- Threat: !InfrastructureShared
-- Name: 517877ae86fb
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
