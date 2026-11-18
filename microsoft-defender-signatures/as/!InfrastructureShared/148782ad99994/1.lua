-- Threat: !InfrastructureShared
-- Name: 148782ad99994
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
