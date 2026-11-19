-- Threat: !InfrastructureShared
-- Name: 4a784ca0eb17
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
