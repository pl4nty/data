-- Threat: !InfrastructureShared
-- Name: 2f78cfa8d450
-- Type: 21

if peattributes.x86_image and peattributes.no_exports and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
