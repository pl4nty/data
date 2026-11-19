-- Threat: !InfrastructureShared
-- Name: 6778e2b44709
-- Type: 21

if mp.HSTR_WEIGHT < 42 and mp.getfilesize() > 4194304 then
  return mp.CLEAN
end
return mp.INFECTED
