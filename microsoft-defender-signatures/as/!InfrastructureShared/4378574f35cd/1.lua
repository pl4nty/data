-- Threat: !InfrastructureShared
-- Name: 4378574f35cd
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() <= 120000 then
  return mp.INFECTED
end
return mp.CLEAN
