-- Threat: !InfrastructureShared
-- Name: 1177880766d45
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
