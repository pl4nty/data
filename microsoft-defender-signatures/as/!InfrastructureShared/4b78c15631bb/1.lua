-- Threat: !InfrastructureShared
-- Name: 4b78c15631bb
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
