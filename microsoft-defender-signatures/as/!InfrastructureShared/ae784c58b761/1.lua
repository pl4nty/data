-- Threat: !InfrastructureShared
-- Name: ae784c58b761
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
