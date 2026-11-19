-- Threat: !InfrastructureShared
-- Name: b67854d49a93
-- Type: 21

local l_0_0 = mp.HSTR_WEIGHT
if hstrlog[6].matched and hstrlog[7].matched then
  l_0_0 = l_0_0 - 2
end
if 5 <= l_0_0 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan_vbinject_ky")
return mp.CLEAN
