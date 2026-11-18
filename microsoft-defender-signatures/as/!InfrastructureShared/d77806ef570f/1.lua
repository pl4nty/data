-- Threat: !InfrastructureShared
-- Name: d77806ef570f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 3198016 then
  return mp.INFECTED
end
return mp.CLEAN
