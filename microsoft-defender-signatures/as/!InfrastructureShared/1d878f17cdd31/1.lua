-- Threat: !InfrastructureShared
-- Name: 1d878f17cdd31
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
