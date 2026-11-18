-- Threat: !InfrastructureShared
-- Name: b07882af1ff6
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.relocs_stripped then
  return mp.INFECTED
end
return mp.CLEAN
