-- Threat: !InfrastructureShared
-- Name: 317813a24f05
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
