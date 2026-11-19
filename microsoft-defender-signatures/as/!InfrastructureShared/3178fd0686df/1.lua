-- Threat: !InfrastructureShared
-- Name: 3178fd0686df
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
