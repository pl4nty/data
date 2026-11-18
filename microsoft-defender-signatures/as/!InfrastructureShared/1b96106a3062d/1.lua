-- Threat: !InfrastructureShared
-- Name: 1b96106a3062d
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/Blohi.Flood") then
  return mp.INFECTED
end
return mp.CLEAN
