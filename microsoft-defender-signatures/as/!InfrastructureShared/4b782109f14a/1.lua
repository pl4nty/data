-- Threat: !InfrastructureShared
-- Name: 4b782109f14a
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
