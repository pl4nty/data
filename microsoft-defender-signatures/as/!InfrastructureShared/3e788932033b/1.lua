-- Threat: !InfrastructureShared
-- Name: 3e788932033b
-- Type: 21

if not peattributes.isexe then
  return mp.CLEAN
end
if mp.ispackedwith("AutoHotKey_+") then
  return mp.CLEAN
end
if (mp.ispackedwith("AutoIt_+") or mp.get_mpattributesubstring("Win32/AutoIt") or mp.get_mpattributesubstring("PESTATIC:cleanstub_autoitv")) and hstrlog[1].matched then
  local l_0_0 = hstrlog[1].match_offsets[3]
  local l_0_1 = hstrlog[1].VA + l_0_0
  local l_0_2 = mp.readu_u32(pe.mmap_va(l_0_1, 4), 1)
  local l_0_3 = mp.readu_u32(pe.mmap_va(l_0_2, 4), 1)
  if l_0_3 ~= 557012289 then
    return mp.INFECTED
  end
end
return mp.CLEAN
