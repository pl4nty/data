-- Threat: !InfrastructureShared
-- Name: 2d784b29d8b4
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
