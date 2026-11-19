-- Threat: !InfrastructureShared
-- Name: 2e78e313098a
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
