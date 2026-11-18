-- Threat: !InfrastructureShared
-- Name: 7f788bdf6560
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
