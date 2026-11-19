-- Threat: !InfrastructureShared
-- Name: 3a78f654a73d
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
