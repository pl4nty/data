-- Threat: !InfrastructureShared
-- Name: 487859ec2def
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 117000 then
  return mp.INFECTED
end
return mp.CLEAN
