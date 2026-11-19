-- Threat: !InfrastructureShared
-- Name: 1d788cf62c8d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
