-- Threat: !InfrastructureShared
-- Name: aa78bc09e0e1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
