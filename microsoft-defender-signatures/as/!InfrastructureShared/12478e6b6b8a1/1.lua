-- Threat: !InfrastructureShared
-- Name: 12478e6b6b8a1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
