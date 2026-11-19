-- Threat: !InfrastructureShared
-- Name: 3a7887251aea
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
