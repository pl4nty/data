-- Threat: !InfrastructureShared
-- Name: 2478edce6ef9
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
