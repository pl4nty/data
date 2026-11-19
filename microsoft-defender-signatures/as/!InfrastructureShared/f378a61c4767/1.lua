-- Threat: !InfrastructureShared
-- Name: f378a61c4767
-- Type: 21

if peattributes.ismsil == true and (peattributes.isexe == true or peattributes.isdll == true) then
  return mp.INFECTED
end
return mp.CLEAN
