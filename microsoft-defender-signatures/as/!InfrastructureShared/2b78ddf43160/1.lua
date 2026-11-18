-- Threat: !InfrastructureShared
-- Name: 2b78ddf43160
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
