-- Threat: !InfrastructureShared
-- Name: 6978a4a62bcb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
