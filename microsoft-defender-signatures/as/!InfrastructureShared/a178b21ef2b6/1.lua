-- Threat: !InfrastructureShared
-- Name: a178b21ef2b6
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
