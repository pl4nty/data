-- Threat: !InfrastructureShared
-- Name: 12a7824f82037
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
