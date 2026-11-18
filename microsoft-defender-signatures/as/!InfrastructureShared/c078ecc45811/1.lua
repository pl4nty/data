-- Threat: !InfrastructureShared
-- Name: c078ecc45811
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
