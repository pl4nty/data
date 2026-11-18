-- Threat: !InfrastructureShared
-- Name: 49783deda2f7
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
