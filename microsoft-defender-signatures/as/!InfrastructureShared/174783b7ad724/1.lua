-- Threat: !InfrastructureShared
-- Name: 174783b7ad724
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
