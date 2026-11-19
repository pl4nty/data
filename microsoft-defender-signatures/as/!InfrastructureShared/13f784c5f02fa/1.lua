-- Threat: !InfrastructureShared
-- Name: 13f784c5f02fa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
