-- Threat: !InfrastructureShared
-- Name: 5078798bfd81
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
