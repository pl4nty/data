-- Threat: !InfrastructureShared
-- Name: 5778aeaeefdd
-- Type: 21

if peattributes.isexe == true and (mp.getfilesize() > 130000 or mp.getfilesize() < 150000) then
  return mp.INFECTED
end
return mp.CLEAN
