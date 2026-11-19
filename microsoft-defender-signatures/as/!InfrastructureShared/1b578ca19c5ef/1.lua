-- Threat: !InfrastructureShared
-- Name: 1b578ca19c5ef
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
