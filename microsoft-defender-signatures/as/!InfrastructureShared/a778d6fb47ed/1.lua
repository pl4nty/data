-- Threat: !InfrastructureShared
-- Name: a778d6fb47ed
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
