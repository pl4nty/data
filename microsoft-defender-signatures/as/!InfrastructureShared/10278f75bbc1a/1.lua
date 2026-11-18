-- Threat: !InfrastructureShared
-- Name: 10278f75bbc1a
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
