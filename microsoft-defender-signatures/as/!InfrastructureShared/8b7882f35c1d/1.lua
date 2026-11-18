-- Threat: !InfrastructureShared
-- Name: 8b7882f35c1d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
