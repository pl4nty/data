-- Threat: !InfrastructureShared
-- Name: 11b78fb4b66df
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
