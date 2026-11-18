-- Threat: !InfrastructureShared
-- Name: 27a78a09fa44f
-- Type: 21

if mp.HSTR_WEIGHT >= 1 then
  local l_0_0
  if hstrlog[1].matched then
    l_0_0 = hstrlog[1].VA
    l_0_0 = l_0_0 - 171
  elseif hstrlog[2].matched then
    l_0_0 = hstrlog[2].VA
    l_0_0 = l_0_0 - 224
  elseif hstrlog[3].matched then
    l_0_0 = hstrlog[3].VA
    l_0_0 = l_0_0 - 272
  elseif hstrlog[4].matched then
    l_0_0 = hstrlog[4].VA
    l_0_0 = l_0_0 - 80
  elseif hstrlog[5].matched then
    l_0_0 = hstrlog[5].VA
    l_0_0 = l_0_0 - 288
  elseif hstrlog[6].matched then
    l_0_0 = hstrlog[6].VA
    l_0_0 = l_0_0 - 352
  elseif hstrlog[7].matched then
    l_0_0 = hstrlog[7].VA
    l_0_0 = l_0_0 - 112
  elseif hstrlog[8].matched then
    l_0_0 = hstrlog[8].VA
    l_0_0 = l_0_0 - 192
  elseif hstrlog[9].matched then
    l_0_0 = hstrlog[9].VA
    l_0_0 = l_0_0 - 336
  elseif hstrlog[10].matched then
    l_0_0 = hstrlog[10].VA
    l_0_0 = l_0_0 - 272
  elseif hstrlog[12].matched then
    l_0_0 = hstrlog[12].VA
    l_0_0 = l_0_0 - 256
  elseif hstrlog[13].matched then
    l_0_0 = hstrlog[13].VA
    l_0_0 = l_0_0 - 112
  elseif hstrlog[14].matched then
    l_0_0 = hstrlog[14].VA
    l_0_0 = l_0_0 - 112
  elseif hstrlog[15].matched then
    l_0_0 = hstrlog[15].VA
    l_0_0 = l_0_0 - 304
  elseif hstrlog[16].matched then
    l_0_0 = hstrlog[16].VA
    l_0_0 = l_0_0 - 464
  elseif hstrlog[17].matched then
    l_0_0 = hstrlog[17].VA
    l_0_0 = l_0_0 - 144
  elseif hstrlog[18].matched then
    l_0_0 = hstrlog[18].VA
    l_0_0 = l_0_0 - 624
  elseif hstrlog[19].matched then
    l_0_0 = hstrlog[19].VA
    l_0_0 = l_0_0 - 336
  elseif hstrlog[23].matched then
    l_0_0 = hstrlog[23].VA
    l_0_0 = l_0_0 - 384
  elseif hstrlog[20].matched then
    l_0_0 = hstrlog[20].VA
    l_0_0 = l_0_0 - 640
  elseif hstrlog[21].matched then
    l_0_0 = hstrlog[21].VA
    l_0_0 = l_0_0 - 336
  elseif hstrlog[22].matched then
    l_0_0 = hstrlog[22].VA
    l_0_0 = l_0_0 - 592
  elseif hstrlog[11].matched then
    l_0_0 = hstrlog[11].VA
  end
  if l_0_0 ~= nil then
    local l_0_1 = "HSTR:VirTool:Win32/Obfuscator.ACV!pointer_" .. string.format("%.08x", l_0_0)
    mp.set_mpattribute(l_0_1)
  end
end
return mp.INFECTED
