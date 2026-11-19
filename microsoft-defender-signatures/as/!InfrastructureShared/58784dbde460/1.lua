-- Threat: !InfrastructureShared
-- Name: 58784dbde460
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
