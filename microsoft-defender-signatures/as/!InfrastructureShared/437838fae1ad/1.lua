-- Threat: !InfrastructureShared
-- Name: 437838fae1ad
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
