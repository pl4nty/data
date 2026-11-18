-- Threat: !InfrastructureShared
-- Name: 45789c26d890
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
