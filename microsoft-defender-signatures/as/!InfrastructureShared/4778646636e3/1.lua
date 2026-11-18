-- Threat: !InfrastructureShared
-- Name: 4778646636e3
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
