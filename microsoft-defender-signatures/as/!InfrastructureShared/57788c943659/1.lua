-- Threat: !InfrastructureShared
-- Name: 57788c943659
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
