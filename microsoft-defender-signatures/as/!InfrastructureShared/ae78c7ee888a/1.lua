-- Threat: !InfrastructureShared
-- Name: ae78c7ee888a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
