-- Threat: !InfrastructureShared
-- Name: c47875e00159
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
