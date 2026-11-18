-- Threat: !InfrastructureShared
-- Name: 43786c49c4f5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
