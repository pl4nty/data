-- Threat: !InfrastructureShared
-- Name: 2478f2c22348
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
