-- Threat: !InfrastructureShared
-- Name: 1978a34aec30
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
