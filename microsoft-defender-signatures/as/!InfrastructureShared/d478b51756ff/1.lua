-- Threat: !InfrastructureShared
-- Name: d478b51756ff
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[4].matched then
  local l_0_1 = hstrlog[4].VA + 32
  local l_0_2 = mp.readu_u32(pe.mmap_va(l_0_1, 4), 1)
  local l_0_3 = mp.utf16to8(pe.mmap_va(l_0_2, 40))
  if string.match(l_0_3, "ServerL") or string.match(l_0_3, "rList") then
    return mp.INFECTED
  end
  l_0_0 = 3
end
if mp.HSTR_WEIGHT - l_0_0 >= 5 then
  return mp.INFECTED
elseif 4 <= mp.HSTR_WEIGHT - l_0_0 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
