-- Threat: !InfrastructureShared
-- Name: 95786ebe187e
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 250000 and mp.getfilesize() < 350000 then
  return mp.INFECTED
end
return mp.CLEAN
