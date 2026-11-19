-- Threat: !InfrastructureShared
-- Name: 4a7816aadf45
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
