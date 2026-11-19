-- Threat: !InfrastructureShared
-- Name: 1f7878922fa1
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
