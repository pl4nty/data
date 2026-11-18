-- Threat: !InfrastructureShared
-- Name: 21787e806463
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
