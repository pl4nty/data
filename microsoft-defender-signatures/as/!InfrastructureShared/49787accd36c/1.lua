-- Threat: !InfrastructureShared
-- Name: 49787accd36c
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
