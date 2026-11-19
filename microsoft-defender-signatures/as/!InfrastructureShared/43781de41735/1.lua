-- Threat: !InfrastructureShared
-- Name: 43781de41735
-- Type: 21

if peattributes.isexe and peattributes.no_security and not peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
