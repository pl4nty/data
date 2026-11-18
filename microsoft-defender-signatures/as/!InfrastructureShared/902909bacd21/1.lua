-- Threat: !InfrastructureShared
-- Name: 902909bacd21
-- Type: 21

if mp.get_mpattribute("Lua:FileSizeLT2000") then
  return mp.INFECTED
end
return mp.CLEAN
