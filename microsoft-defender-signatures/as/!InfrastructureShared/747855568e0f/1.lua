-- Threat: !InfrastructureShared
-- Name: 747855568e0f
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
