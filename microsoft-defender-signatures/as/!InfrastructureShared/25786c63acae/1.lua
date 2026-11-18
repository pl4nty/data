-- Threat: !InfrastructureShared
-- Name: 25786c63acae
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
