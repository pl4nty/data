-- Threat: !InfrastructureShared
-- Name: 3078f2eba53f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
