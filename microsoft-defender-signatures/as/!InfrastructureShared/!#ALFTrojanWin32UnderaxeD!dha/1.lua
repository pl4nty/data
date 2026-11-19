-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Underaxe.D!dha
-- Type: 13

if mp.HEADERPAGE_SZ < 256 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 5) == mp.getfilesize() - 12 then
  local l_0_0 = mp.bitxor(mp.readu_u32(headerpage, 1), mp.readu_u32(headerpage, 9))
  if 65536 <= l_0_0 and l_0_0 < 262144 then
    local l_0_1 = mp.readu_u32(headerpage, 1)
    l_0_1 = l_0_1 + mp.shr32(l_0_1, 1)
    l_0_1 = l_0_1 - mp.shl32(l_0_1, 2)
    l_0_1 = l_0_1 - mp.shr32(l_0_1, 3)
    l_0_1 = l_0_1 * 17
    l_0_1 = l_0_1 - mp.shl32(l_0_1, 2)
    l_0_1 = l_0_1 - mp.shr32(l_0_1, 3)
    l_0_1 = l_0_1 * 17
    l_0_1 = l_0_1 - mp.shr32(l_0_1, 3)
    l_0_1 = l_0_1 * 17
    l_0_1 = l_0_1 * 17
    if mp.bitxor(headerpage[16], mp.bitand(l_0_1, 255)) ~= 77 then
      return mp.CLEAN
    end
    l_0_1 = l_0_1 + mp.shr32(l_0_1, 1)
    l_0_1 = l_0_1 - mp.shl32(l_0_1, 2)
    l_0_1 = l_0_1 - mp.shr32(l_0_1, 3)
    l_0_1 = l_0_1 * 17
    if mp.bitxor(headerpage[17], mp.bitand(l_0_1, 255)) ~= 90 then
      return mp.CLEAN
    end
    mp.set_mpattribute("MpNonPIIFileType")
    return mp.INFECTED
  end
end
return mp.CLEAN
