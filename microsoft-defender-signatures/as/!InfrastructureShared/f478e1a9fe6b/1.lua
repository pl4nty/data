-- Threat: !InfrastructureShared
-- Name: f478e1a9fe6b
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
