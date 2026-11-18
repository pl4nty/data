-- Threat: !InfrastructureShared
-- Name: f540bc62de2a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
