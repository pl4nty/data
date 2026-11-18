-- Threat: !InfrastructureShared
-- Name: 14778b2f52dce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
