-- Threat: !InfrastructureShared
-- Name: d3780d1e3b73
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
