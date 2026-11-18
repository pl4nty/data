-- Threat: !InfrastructureShared
-- Name: 4178e3a0b5f0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
