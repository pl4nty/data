-- Threat: !InfrastructureShared
-- Name: 1f78e6ceae38
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
