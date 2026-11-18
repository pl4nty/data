-- Threat: !InfrastructureShared
-- Name: 1437861baf09c
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
