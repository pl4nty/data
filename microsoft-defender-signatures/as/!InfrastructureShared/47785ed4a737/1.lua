-- Threat: !InfrastructureShared
-- Name: 47785ed4a737
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if mp.ispackedwith("AutoHotKey_+") then
  return mp.CLEAN
end
if mp.ispackedwith("AutoIt_+") or mp.get_mpattributesubstring("Win32/AutoIt") or mp.get_mpattributesubstring("PESTATIC:cleanstub_autoitv") then
  local l_0_0, l_0_1
  if hstrlog[1].matched then
    l_0_0 = hstrlog[1].match_offsets[1]
    l_0_1 = hstrlog[1].VA + l_0_0
    local l_0_2 = mp.readu_u32(pe.mmap_va(l_0_1, 4), 1)
    local l_0_3 = mp.readu_u32(pe.mmap_va(l_0_2, 4), 1)
    local l_0_4 = mp.readu_u32(pe.mmap_va(l_0_2 + 4, 4), 1)
    local l_0_5 = mp.readu_u32(pe.mmap_va(l_0_2 + 8, 4), 1)
    local l_0_6 = mp.readu_u32(pe.mmap_va(l_0_2 + 12, 4), 1)
    if l_0_3 ~= 3192604835 then
      return mp.INFECTED
    end
    if l_0_4 ~= 2840226968 then
      return mp.INFECTED
    end
    if l_0_5 ~= 173231257 then
      return mp.INFECTED
    end
    if l_0_6 ~= 2101925510 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
