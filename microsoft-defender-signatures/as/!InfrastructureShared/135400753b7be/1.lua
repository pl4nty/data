-- Threat: !InfrastructureShared
-- Name: 135400753b7be
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
