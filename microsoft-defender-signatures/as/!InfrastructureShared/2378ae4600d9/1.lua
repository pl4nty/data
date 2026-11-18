-- Threat: !InfrastructureShared
-- Name: 2378ae4600d9
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
