-- Threat: !InfrastructureShared
-- Name: 17c789f051701
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
