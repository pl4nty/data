-- Threat: !InfrastructureShared
-- Name: 4178ecbe4903
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
    l_0_0 = hstrlog[1].match_offsets[3]
    l_0_1 = hstrlog[1].VA + l_0_0
    local l_0_2 = mp.readu_u32(pe.mmap_va(l_0_1, 4), 1)
    local l_0_3 = mp.readu_u32(pe.mmap_va(l_0_2, 4), 1)
    if l_0_3 ~= 909132101 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
