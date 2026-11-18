-- Threat: !InfrastructureShared
-- Name: 787846f0062c
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
