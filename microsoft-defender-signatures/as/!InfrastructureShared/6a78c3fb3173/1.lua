-- Threat: !InfrastructureShared
-- Name: 6a78c3fb3173
-- Type: 21

if peattributes.ismsil == true and (peattributes.isexe == true or peattributes.isdll == true) then
  return mp.INFECTED
end
return mp.CLEAN
