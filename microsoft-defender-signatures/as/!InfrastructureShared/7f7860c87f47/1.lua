-- Threat: !InfrastructureShared
-- Name: 7f7860c87f47
-- Type: 21

if (peattributes.isdll == true or peattributes.isexe == true) and mp.getfilesize() < 900000 then
  return mp.INFECTED
end
return mp.CLEAN
