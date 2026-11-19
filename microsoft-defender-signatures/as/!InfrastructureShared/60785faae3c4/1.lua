-- Threat: !InfrastructureShared
-- Name: 60785faae3c4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
