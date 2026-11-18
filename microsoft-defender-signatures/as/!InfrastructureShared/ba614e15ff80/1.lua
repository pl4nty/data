-- Threat: !InfrastructureShared
-- Name: ba614e15ff80
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE10000.A") then
  return mp.INFECTED
end
return mp.CLEAN
