-- Threat: !InfrastructureShared
-- Name: cc7889eb8690
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
