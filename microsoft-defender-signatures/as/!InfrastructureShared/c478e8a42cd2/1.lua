-- Threat: !InfrastructureShared
-- Name: c478e8a42cd2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
