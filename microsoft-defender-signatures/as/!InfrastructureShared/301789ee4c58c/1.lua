-- Threat: !InfrastructureShared
-- Name: 301789ee4c58c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
