-- Threat: !InfrastructureShared
-- Name: 897873c71962
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
