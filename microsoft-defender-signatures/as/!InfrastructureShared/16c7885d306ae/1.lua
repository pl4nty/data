-- Threat: !InfrastructureShared
-- Name: 16c7885d306ae
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
