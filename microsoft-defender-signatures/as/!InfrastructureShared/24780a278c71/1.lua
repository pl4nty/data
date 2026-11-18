-- Threat: !InfrastructureShared
-- Name: 24780a278c71
-- Type: 21

if peattributes.executable_image and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
