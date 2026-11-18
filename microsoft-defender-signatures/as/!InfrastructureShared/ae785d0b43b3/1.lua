-- Threat: !InfrastructureShared
-- Name: ae785d0b43b3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
