-- Threat: !InfrastructureShared
-- Name: 3078839f433f
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
