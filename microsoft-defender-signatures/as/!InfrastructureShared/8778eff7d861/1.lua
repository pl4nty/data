-- Threat: !InfrastructureShared
-- Name: 8778eff7d861
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
