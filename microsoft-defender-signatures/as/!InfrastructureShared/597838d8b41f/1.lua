-- Threat: !InfrastructureShared
-- Name: 597838d8b41f
-- Type: 21

if peattributes.no_security and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
