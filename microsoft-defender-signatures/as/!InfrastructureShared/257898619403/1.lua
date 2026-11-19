-- Threat: !InfrastructureShared
-- Name: 257898619403
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
