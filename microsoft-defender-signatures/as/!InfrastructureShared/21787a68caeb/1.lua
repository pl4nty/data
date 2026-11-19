-- Threat: !InfrastructureShared
-- Name: 21787a68caeb
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
