-- Threat: !InfrastructureShared
-- Name: 21783f034754
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
