-- Threat: !InfrastructureShared
-- Name: bd78f852903c
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
