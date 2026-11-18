-- Threat: !InfrastructureShared
-- Name: 2e78e6cda831
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
