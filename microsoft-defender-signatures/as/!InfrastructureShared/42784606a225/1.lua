-- Threat: !InfrastructureShared
-- Name: 42784606a225
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
