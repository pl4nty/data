-- Threat: !InfrastructureShared
-- Name: 407851c8acaa
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
