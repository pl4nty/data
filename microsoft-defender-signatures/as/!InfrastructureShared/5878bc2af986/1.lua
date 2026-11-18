-- Threat: !InfrastructureShared
-- Name: 5878bc2af986
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
