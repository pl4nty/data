-- Threat: !InfrastructureShared
-- Name: 135404fc314f4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
