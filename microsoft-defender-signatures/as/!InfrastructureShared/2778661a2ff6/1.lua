-- Threat: !InfrastructureShared
-- Name: 2778661a2ff6
-- Type: 21

if mp.get_mpattribute("SIGATTR:Win32/BINinRsrc") then
  return mp.INFECTED
end
return mp.CLEAN
