-- Threat: !InfrastructureShared
-- Name: 4578e8f9a63c
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
