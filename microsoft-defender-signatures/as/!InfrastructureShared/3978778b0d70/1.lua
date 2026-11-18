-- Threat: !InfrastructureShared
-- Name: 3978778b0d70
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
