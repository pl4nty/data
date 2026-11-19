-- Threat: !InfrastructureShared
-- Name: 9c785fd1e70f
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
