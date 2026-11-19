-- Threat: !InfrastructureShared
-- Name: a678c39e4288
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
