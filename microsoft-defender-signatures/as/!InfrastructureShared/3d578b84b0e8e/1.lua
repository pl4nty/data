-- Threat: !InfrastructureShared
-- Name: 3d578b84b0e8e
-- Type: 21

if mp.get_mpattribute("HSTR:Exception:Mimikatz.A") then
  return mp.CLEAN
end
return mp.INFECTED
