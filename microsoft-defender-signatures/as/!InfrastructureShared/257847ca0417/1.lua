-- Threat: !InfrastructureShared
-- Name: 257847ca0417
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
