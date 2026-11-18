-- Threat: !InfrastructureShared
-- Name: 577804ec6023
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
