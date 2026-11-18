-- Threat: !InfrastructureShared
-- Name: 2578c40975bf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
