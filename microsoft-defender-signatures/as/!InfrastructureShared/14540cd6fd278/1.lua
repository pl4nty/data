-- Threat: !InfrastructureShared
-- Name: 14540cd6fd278
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
