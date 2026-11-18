-- Threat: !InfrastructureShared
-- Name: 7778c8e59cb9
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
