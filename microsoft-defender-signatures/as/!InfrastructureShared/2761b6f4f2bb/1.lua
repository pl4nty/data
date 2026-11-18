-- Threat: !InfrastructureShared
-- Name: 2761b6f4f2bb
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
