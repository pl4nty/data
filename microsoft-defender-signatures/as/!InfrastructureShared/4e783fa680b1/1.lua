-- Threat: !InfrastructureShared
-- Name: 4e783fa680b1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
