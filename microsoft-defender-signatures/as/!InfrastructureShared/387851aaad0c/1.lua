-- Threat: !InfrastructureShared
-- Name: 387851aaad0c
-- Type: 21

if peattributes.isexe and peattributes.amd64_image and peattributes.debug_stripped then
  return mp.INFECTED
end
return mp.CLEAN
