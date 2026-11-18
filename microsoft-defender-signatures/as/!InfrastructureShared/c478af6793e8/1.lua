-- Threat: !InfrastructureShared
-- Name: c478af6793e8
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 3198016 then
  return mp.INFECTED
end
return mp.CLEAN
