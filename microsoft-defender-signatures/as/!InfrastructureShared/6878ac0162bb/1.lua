-- Threat: !InfrastructureShared
-- Name: 6878ac0162bb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
