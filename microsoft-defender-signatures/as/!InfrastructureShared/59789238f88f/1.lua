-- Threat: !InfrastructureShared
-- Name: 59789238f88f
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
