-- Threat: !InfrastructureShared
-- Name: e540bc49e410
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
