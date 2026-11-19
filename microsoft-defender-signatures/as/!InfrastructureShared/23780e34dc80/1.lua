-- Threat: !InfrastructureShared
-- Name: 23780e34dc80
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
