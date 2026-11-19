-- Threat: !InfrastructureShared
-- Name: 130783672b7b1
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
