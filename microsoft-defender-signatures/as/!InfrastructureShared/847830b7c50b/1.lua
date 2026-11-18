-- Threat: !InfrastructureShared
-- Name: 847830b7c50b
-- Type: 21

if peattributes.no_imports and peattributes.no_exports and peattributes.x86_image and peattributes.executable_image then
  return mp.INFECTED
end
return mp.CLEAN
