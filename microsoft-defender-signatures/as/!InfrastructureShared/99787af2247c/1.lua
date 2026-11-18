-- Threat: !InfrastructureShared
-- Name: 99787af2247c
-- Type: 21
-- Flags: 1

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil or l_0_0.InternalName == nil or l_0_0.CompanyName == nil then
  return mp.LOWFI
end
if string.find(l_0_0.InternalName, "CMClient.exe", 1, true) and string.find(l_0_0.InternalName, "netbar's maintenance", 1, true) == nil then
  return mp.INFECTED
end
return mp.LOWFI
