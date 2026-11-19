-- Threat: !InfrastructureShared
-- Name: 9378d4b076b0
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
