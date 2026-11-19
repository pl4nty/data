-- Threat: !InfrastructureShared
-- Name: e878157b4260
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
