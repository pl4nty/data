-- Threat: !InfrastructureShared
-- Name: 11a78662337f5
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 5013504 and mp.getfilesize() < 5046272 then
  return mp.INFECTED
end
return mp.CLEAN
