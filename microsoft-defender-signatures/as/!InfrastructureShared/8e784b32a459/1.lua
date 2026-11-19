-- Threat: !InfrastructureShared
-- Name: 8e784b32a459
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
