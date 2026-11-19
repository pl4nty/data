-- Threat: !InfrastructureShared
-- Name: 3e7891c27d36
-- Type: 21

if mp.get_mpattribute("HSTR:Exception:Mimikatz.A") then
  return mp.CLEAN
end
return mp.INFECTED
