-- Threat: !InfrastructureShared
-- Name: 2f788f7af465
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
