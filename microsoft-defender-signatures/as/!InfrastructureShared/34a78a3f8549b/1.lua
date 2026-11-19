-- Threat: !InfrastructureShared
-- Name: 34a78a3f8549b
-- Type: 21

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + hstrlog[1].hitcount
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + hstrlog[2].hitcount
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + hstrlog[3].hitcount
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + hstrlog[4].hitcount
end
if hstrlog[5].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[6].matched then
  l_0_0 = l_0_0 + hstrlog[6].hitcount
end
if hstrlog[7].matched then
  l_0_0 = l_0_0 + hstrlog[7].hitcount
end
if hstrlog[8].matched then
  l_0_0 = l_0_0 + hstrlog[8].hitcount
end
if hstrlog[9].matched then
  l_0_0 = l_0_0 + hstrlog[9].hitcount
end
if hstrlog[10].matched then
  l_0_0 = l_0_0 + hstrlog[10].hitcount
end
if hstrlog[11].matched then
  l_0_0 = l_0_0 + hstrlog[11].hitcount
end
if hstrlog[12].matched then
  l_0_0 = l_0_0 + hstrlog[12].hitcount
end
if 6 <= l_0_0 or 4 <= mp.HSTR_WEIGHT and 4 < l_0_0 then
  if not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
  end
  mp.set_mpattribute("MpRequestSMSM")
  return mp.INFECTED
end
return mp.CLEAN
