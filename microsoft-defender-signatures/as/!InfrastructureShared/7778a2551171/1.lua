-- Threat: !InfrastructureShared
-- Name: 7778a2551171
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
