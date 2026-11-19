-- Threat: !InfrastructureShared
-- Name: 337892c12b6b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
