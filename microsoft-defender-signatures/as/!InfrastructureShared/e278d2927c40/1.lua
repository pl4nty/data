-- Threat: !InfrastructureShared
-- Name: e278d2927c40
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
