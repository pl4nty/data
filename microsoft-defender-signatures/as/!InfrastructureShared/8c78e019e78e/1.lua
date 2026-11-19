-- Threat: !InfrastructureShared
-- Name: 8c78e019e78e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
