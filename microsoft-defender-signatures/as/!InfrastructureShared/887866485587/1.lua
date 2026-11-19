-- Threat: !InfrastructureShared
-- Name: 887866485587
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
