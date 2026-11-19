-- Threat: !InfrastructureShared
-- Name: 8178c71b7fa4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
