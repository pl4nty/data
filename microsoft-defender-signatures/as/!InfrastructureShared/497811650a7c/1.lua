-- Threat: !InfrastructureShared
-- Name: 497811650a7c
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.relocs_stripped then
  return mp.INFECTED
end
return mp.CLEAN
