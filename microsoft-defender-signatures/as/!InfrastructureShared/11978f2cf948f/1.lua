-- Threat: !InfrastructureShared
-- Name: 11978f2cf948f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
