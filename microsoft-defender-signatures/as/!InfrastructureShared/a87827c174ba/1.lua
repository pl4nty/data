-- Threat: !InfrastructureShared
-- Name: a87827c174ba
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
