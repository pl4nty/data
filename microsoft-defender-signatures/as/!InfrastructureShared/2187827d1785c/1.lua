-- Threat: !InfrastructureShared
-- Name: 2187827d1785c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
