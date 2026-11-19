-- Threat: !InfrastructureShared
-- Name: a540ad1e3091
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
