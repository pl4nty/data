-- Threat: !InfrastructureShared
-- Name: 71786c8681c1
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
