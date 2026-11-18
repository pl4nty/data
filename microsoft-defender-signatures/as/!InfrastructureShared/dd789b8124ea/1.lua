-- Threat: !InfrastructureShared
-- Name: dd789b8124ea
-- Type: 21

if mp.HSTR_WEIGHT < 6 or not peattributes.isdll then
  return mp.CLEAN
end
return mp.INFECTED
