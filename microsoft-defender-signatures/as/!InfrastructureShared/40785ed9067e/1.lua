-- Threat: !InfrastructureShared
-- Name: 40785ed9067e
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
