-- Threat: !InfrastructureShared
-- Name: 5e7846ea647a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
