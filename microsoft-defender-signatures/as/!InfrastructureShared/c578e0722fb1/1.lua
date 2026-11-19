-- Threat: !InfrastructureShared
-- Name: c578e0722fb1
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
