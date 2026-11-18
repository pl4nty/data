-- Threat: !InfrastructureShared
-- Name: 80785d6a301e
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
