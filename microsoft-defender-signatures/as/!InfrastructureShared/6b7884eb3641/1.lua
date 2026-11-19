-- Threat: !InfrastructureShared
-- Name: 6b7884eb3641
-- Type: 21

if peattributes.isexe and peattributes.no_security and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
