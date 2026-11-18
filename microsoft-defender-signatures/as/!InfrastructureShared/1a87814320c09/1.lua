-- Threat: !InfrastructureShared
-- Name: 1a87814320c09
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
