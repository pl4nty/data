-- Threat: !InfrastructureShared
-- Name: b2619bab8739
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
