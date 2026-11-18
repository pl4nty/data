-- Threat: !InfrastructureShared
-- Name: 7678241acbac
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_exports and peattributes.calls_unimplemented_api then
  return mp.INFECTED
end
return mp.CLEAN
