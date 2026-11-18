-- Threat: !InfrastructureShared
-- Name: 37780491b09d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
