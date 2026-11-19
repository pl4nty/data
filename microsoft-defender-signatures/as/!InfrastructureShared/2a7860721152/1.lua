-- Threat: !InfrastructureShared
-- Name: 2a7860721152
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 70000000 then
  return mp.INFECTED
end
return mp.CLEAN
