-- Threat: !InfrastructureShared
-- Name: 3778ecf455a0
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
