-- Threat: !InfrastructureShared
-- Name: d578bf5fd64a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
