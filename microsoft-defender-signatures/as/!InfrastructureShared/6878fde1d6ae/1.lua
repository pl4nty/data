-- Threat: !InfrastructureShared
-- Name: 6878fde1d6ae
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
