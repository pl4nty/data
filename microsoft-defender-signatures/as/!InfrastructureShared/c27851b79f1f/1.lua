-- Threat: !InfrastructureShared
-- Name: c27851b79f1f
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
