-- Threat: !InfrastructureShared
-- Name: 2778bd11b48a
-- Type: 21

if mp.get_mpattribute("HSTR:Exception:Mimikatz.A") then
  return mp.CLEAN
end
return mp.INFECTED
