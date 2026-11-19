-- Threat: !InfrastructureShared
-- Name: f27854ae4743
-- Type: 21

local l_0_0 = 0
if hstrlog[9].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[10].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[11].matched then
  l_0_0 = l_0_0 + 1
end
if mp.HSTR_WEIGHT >= 100 and 2 <= l_0_0 then
  return mp.INFECTED
end
if 3 <= l_0_0 and hstrlog[12].matched then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
