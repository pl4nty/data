-- Threat: !InfrastructureShared
-- Name: 1b1784cd3c907
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 300000 then
  return mp.INFECTED
end
return mp.CLEAN
