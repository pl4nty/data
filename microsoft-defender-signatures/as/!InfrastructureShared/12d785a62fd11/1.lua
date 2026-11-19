-- Threat: !InfrastructureShared
-- Name: 12d785a62fd11
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
