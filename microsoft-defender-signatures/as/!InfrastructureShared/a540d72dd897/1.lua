-- Threat: !InfrastructureShared
-- Name: a540d72dd897
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
