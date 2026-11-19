-- Threat: !InfrastructureShared
-- Name: c1782c130ad6
-- Type: 21

if mp.get_mpattribute("SIGATTR:Win32/Banload.ARM") then
  return mp.INFECTED
end
return mp.SUSPICIOUS
