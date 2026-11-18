-- Threat: !InfrastructureShared
-- Name: 6540d8402e79
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
