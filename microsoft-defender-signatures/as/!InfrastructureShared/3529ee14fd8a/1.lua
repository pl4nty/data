-- Threat: !InfrastructureShared
-- Name: 3529ee14fd8a
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE100.A") then
  return mp.INFECTED
end
return mp.LOWFI
