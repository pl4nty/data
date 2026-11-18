-- Threat: !InfrastructureShared
-- Name: a8787a8a6329
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
