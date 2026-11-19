-- Threat: !InfrastructureShared
-- Name: 6a7880110476
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
