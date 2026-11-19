-- Threat: !InfrastructureShared
-- Name: 2f788821734c
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
