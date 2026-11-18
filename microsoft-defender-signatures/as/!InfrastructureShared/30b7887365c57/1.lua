-- Threat: !InfrastructureShared
-- Name: 30b7887365c57
-- Type: 21

if (peattributes.isvbpcode or peattributes.isvbnative) and mp.getfilesize() < 65536 then
  if mp.HSTR_WEIGHT >= 12 then
    return mp.INFECTED
  end
  return mp.LOWFI
end
return mp.CLEAN
