-- Threat: !InfrastructureShared
-- Name: 3a78b0b979d6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
