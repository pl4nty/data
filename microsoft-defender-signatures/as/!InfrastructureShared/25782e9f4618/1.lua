-- Threat: !InfrastructureShared
-- Name: 25782e9f4618
-- Type: 21

if peattributes.ismsil == true and (peattributes.isexe == true or peattributes.isdll == true) then
  return mp.INFECTED
end
return mp.CLEAN
