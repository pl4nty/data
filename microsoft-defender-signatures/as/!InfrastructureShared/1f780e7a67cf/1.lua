-- Threat: !InfrastructureShared
-- Name: 1f780e7a67cf
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
