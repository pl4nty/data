-- Threat: !InfrastructureShared
-- Name: 3e78e3bc6be8
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
