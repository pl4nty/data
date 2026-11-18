-- Threat: !InfrastructureShared
-- Name: 3378d030962d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
