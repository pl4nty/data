-- Threat: !InfrastructureShared
-- Name: 59978c69c43cd
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
