-- Threat: !InfrastructureShared
-- Name: 2b78bb03d846
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
