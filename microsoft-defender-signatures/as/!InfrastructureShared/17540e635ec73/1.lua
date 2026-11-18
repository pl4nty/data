-- Threat: !InfrastructureShared
-- Name: 17540e635ec73
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
