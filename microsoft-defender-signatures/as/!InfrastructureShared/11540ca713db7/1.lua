-- Threat: !InfrastructureShared
-- Name: 11540ca713db7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
