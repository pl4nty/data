-- Threat: !InfrastructureShared
-- Name: 42787571a0d0
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
