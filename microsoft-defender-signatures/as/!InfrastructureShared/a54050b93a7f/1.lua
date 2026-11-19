-- Threat: !InfrastructureShared
-- Name: a54050b93a7f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
