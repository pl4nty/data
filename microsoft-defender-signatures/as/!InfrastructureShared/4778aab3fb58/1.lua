-- Threat: !InfrastructureShared
-- Name: 4778aab3fb58
-- Type: 21

if peattributes.ismsil == true and (peattributes.isexe == true or peattributes.isdll == true) then
  return mp.INFECTED
end
return mp.CLEAN
