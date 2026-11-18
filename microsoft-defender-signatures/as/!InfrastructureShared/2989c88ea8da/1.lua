-- Threat: !InfrastructureShared
-- Name: 2989c88ea8da
-- Type: 21

if mp.get_mpattribute("RPF:LowFiObfuscatorVM") then
  return mp.INFECTED
end
return mp.CLEAN
