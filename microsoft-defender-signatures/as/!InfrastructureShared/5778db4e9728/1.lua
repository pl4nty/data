-- Threat: !InfrastructureShared
-- Name: 5778db4e9728
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 5767168 then
  return mp.INFECTED
end
return mp.CLEAN
