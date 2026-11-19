-- Threat: !InfrastructureShared
-- Name: 52784e384e5c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
