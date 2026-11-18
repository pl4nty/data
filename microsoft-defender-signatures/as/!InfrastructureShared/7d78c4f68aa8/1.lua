-- Threat: !InfrastructureShared
-- Name: 7d78c4f68aa8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
