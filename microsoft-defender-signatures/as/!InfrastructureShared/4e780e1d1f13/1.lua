-- Threat: !InfrastructureShared
-- Name: 4e780e1d1f13
-- Type: 21

if mp.HSTR_WEIGHT == 1 then
  local l_0_0
  if hstrlog[1].matched then
    l_0_0 = hstrlog[1].VA
  end
  if hstrlog[2].matched then
    l_0_0 = hstrlog[2].VA
  end
  if hstrlog[3].matched then
    l_0_0 = hstrlog[3].VA
  end
  if hstrlog[4].matched then
    l_0_0 = hstrlog[4].VA
  end
  if hstrlog[5].matched then
    l_0_0 = hstrlog[5].VA
  end
  if hstrlog[6].matched then
    l_0_0 = hstrlog[6].VA
  end
  if hstrlog[7].matched then
    l_0_0 = hstrlog[7].VA
  end
  if l_0_0 ~= nil then
    local l_0_1 = "HSTR:VirTool:Win32/Obfuscator.WU.offset_" .. string.format("%.08x", l_0_0)
    mp.set_mpattribute(l_0_1)
  end
end
return mp.INFECTED
