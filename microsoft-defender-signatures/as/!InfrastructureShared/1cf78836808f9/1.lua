-- Threat: !InfrastructureShared
-- Name: 1cf78836808f9
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
