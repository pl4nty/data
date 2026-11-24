-- Threat: !InfrastructureShared
-- Name: 3278da3b503c
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
