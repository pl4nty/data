-- Threat: !InfrastructureShared
-- Name: f2771fac22b
-- Type: 21

if mp.get_mpattribute("Lua:FileSizeLT2000") then
  return mp.INFECTED
end
return mp.CLEAN
