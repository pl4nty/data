-- Threat: !InfrastructureShared
-- Name: 6e7862e8c7c9
-- Type: 21

if mp.HSTR_WEIGHT == 101 then
  return mp.INFECTED
elseif mp.HSTR_WEIGHT > 199 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
