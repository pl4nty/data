-- Threat: !InfrastructureShared
-- Name: 4540d95369c8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
