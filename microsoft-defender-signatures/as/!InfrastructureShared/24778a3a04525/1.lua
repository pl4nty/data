-- Threat: !InfrastructureShared
-- Name: 24778a3a04525
-- Type: 21

if mp.HSTR_WEIGHT >= 200 then
  return mp.INFECTED
elseif mp.HSTR_WEIGHT >= 4 and mp.HSTR_WEIGHT < 20 then
  mp.changedetectionname(805306498)
  return mp.INFECTED
end
return mp.CLEAN
