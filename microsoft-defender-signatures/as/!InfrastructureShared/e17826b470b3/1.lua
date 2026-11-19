-- Threat: !InfrastructureShared
-- Name: e17826b470b3
-- Type: 21

if peattributes.ismsil and mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
