-- Threat: !InfrastructureShared
-- Name: 587860ee0332
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
