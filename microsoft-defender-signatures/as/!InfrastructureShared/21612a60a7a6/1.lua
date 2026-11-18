-- Threat: !InfrastructureShared
-- Name: 21612a60a7a6
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
