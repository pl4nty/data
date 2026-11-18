-- Threat: !InfrastructureShared
-- Name: 1d78c7261a7c
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
