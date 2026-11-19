-- Threat: !InfrastructureShared
-- Name: 4e786229fcff
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
