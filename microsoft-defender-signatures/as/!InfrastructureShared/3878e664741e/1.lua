-- Threat: !InfrastructureShared
-- Name: 3878e664741e
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
