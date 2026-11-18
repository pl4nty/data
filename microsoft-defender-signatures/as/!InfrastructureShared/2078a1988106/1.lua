-- Threat: !InfrastructureShared
-- Name: 2078a1988106
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
