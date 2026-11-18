-- Threat: !InfrastructureShared
-- Name: 11b78bfeb5de0
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
