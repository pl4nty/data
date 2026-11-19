-- Threat: !InfrastructureShared
-- Name: 8d7817e724da
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
