-- Threat: !InfrastructureShared
-- Name: 6a7847f189a0
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
