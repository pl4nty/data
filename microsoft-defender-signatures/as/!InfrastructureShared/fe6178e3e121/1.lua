-- Threat: !InfrastructureShared
-- Name: fe6178e3e121
-- Type: 21

if mp.get_mpattribute("NID:Adware:Win32/Linkury.A1") then
  return mp.INFECTED
end
return mp.CLEAN
