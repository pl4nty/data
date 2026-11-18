-- Threat: !InfrastructureShared
-- Name: e540c6fa378d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
