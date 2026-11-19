-- Threat: !InfrastructureShared
-- Name: 2d7840d371db
-- Type: 21

if peattributes.x86_image and peattributes.isexe and peattributes.no_exports and peattributes.relocs_stripped then
  return mp.INFECTED
end
return mp.CLEAN
