-- Threat: !InfrastructureShared
-- Name: 377801831b88
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
local l_0_0 = getDetectedRegions()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.size <= 16384 and (l_0_2.prot == 32 or l_0_2.prot == 4) and l_0_2.state_type == mp.bitor(mp.SMS_MBI_COMMIT, mp.SMS_MBI_PRIVATE) then
    return mp.INFECTED
  end
end
return mp.CLEAN
