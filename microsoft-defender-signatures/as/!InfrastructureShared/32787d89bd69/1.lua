-- Threat: !InfrastructureShared
-- Name: 32787d89bd69
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
