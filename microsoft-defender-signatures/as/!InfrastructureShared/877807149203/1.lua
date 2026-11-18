-- Threat: !InfrastructureShared
-- Name: 877807149203
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
