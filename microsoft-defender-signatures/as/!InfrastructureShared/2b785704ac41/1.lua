-- Threat: !InfrastructureShared
-- Name: 2b785704ac41
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
