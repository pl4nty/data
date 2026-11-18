-- Threat: !InfrastructureShared
-- Name: 5278325c800c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
