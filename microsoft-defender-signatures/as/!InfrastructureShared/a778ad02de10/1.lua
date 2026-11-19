-- Threat: !InfrastructureShared
-- Name: a778ad02de10
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
