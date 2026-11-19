-- Threat: !InfrastructureShared
-- Name: 8978c10f636b
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
