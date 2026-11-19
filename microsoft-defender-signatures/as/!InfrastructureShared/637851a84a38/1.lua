-- Threat: !InfrastructureShared
-- Name: 637851a84a38
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
