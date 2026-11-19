-- Threat: !InfrastructureShared
-- Name: 4478b5177307
-- Type: 21

if peattributes.x86_image and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
