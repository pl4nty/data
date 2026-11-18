-- Threat: !InfrastructureShared
-- Name: 1f784992d083
-- Type: 21

if mp.get_mpattribute("FOP:Trojan:Win32/Chepdu.X") then
  return mp.INFECTED
end
return mp.CLEAN
