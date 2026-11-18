-- Threat: !InfrastructureShared
-- Name: 7578e41755ad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
