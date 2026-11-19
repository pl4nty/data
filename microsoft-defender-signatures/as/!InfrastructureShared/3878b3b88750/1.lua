-- Threat: !InfrastructureShared
-- Name: 3878b3b88750
-- Type: 21

if peattributes.ismsil == true and (peattributes.isexe == true or peattributes.isdll == true) then
  return mp.INFECTED
end
return mp.CLEAN
