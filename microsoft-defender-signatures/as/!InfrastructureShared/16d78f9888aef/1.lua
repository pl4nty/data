-- Threat: !InfrastructureShared
-- Name: 16d78f9888aef
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
