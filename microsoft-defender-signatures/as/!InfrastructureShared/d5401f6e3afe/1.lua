-- Threat: !InfrastructureShared
-- Name: d5401f6e3afe
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.debug_stripped then
  return mp.INFECTED
end
return mp.CLEAN
