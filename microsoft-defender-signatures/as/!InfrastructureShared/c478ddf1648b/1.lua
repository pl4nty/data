-- Threat: !InfrastructureShared
-- Name: c478ddf1648b
-- Type: 21

if peattributes.isexe == true and (pesecs[4].Name == ".hertdhr" or pesecs[4].Name == ".jrehtrj") and mp.getfilesize() < 2690050 then
  return mp.INFECTED
end
return mp.CLEAN
