-- Threat: !InfrastructureShared
-- Name: 277876b4b2b2
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
