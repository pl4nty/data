-- Threat: !InfrastructureShared
-- Name: 74784e44a9ac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
