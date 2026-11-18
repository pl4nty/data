-- Threat: !InfrastructureShared
-- Name: 46789fdee2e8
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_security and peattributes.no_comruntime then
  return mp.INFECTED
end
return mp.CLEAN
