-- Threat: !InfrastructureShared
-- Name: 3478dce51446
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
