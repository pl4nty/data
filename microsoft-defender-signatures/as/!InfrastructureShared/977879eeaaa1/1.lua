-- Threat: !InfrastructureShared
-- Name: 977879eeaaa1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
