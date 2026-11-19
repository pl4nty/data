-- Threat: !InfrastructureShared
-- Name: 5678aa1725ec
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
