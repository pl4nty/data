-- Threat: !InfrastructureShared
-- Name: 3b78b89454c4
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.suspicious_linker_version then
  return mp.INFECTED
end
return mp.CLEAN
