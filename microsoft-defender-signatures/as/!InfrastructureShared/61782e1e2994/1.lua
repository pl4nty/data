-- Threat: !InfrastructureShared
-- Name: 61782e1e2994
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
