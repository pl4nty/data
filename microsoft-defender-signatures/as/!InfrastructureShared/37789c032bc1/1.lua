-- Threat: !InfrastructureShared
-- Name: 37789c032bc1
-- Type: 21

if peattributes.is_delphi then
  return mp.CLEAN
end
if not peattributes.isexe then
  return mp.CLEAN
end
if mp.ispackedwith("AutoHotKey_+") then
  return mp.CLEAN
end
if mp.ispackedwith("AutoIt_+") or mp.get_mpattributesubstring("Win32/AutoIt") or mp.get_mpattributesubstring("PESTATIC:cleanstub_autoitv") then
  local l_0_0, l_0_1, l_0_2
  if hstrlog[1].matched then
    l_0_2 = hstrlog[1].match_offsets_count
    if 6 <= l_0_2 then
      l_0_1 = hstrlog[1].match_offsets[4]
      l_0_0 = hstrlog[1].VA + l_0_1
      local l_0_3 = mp.readu_u32(pe.mmap_va(l_0_0, 4), 1)
      local l_0_4 = mp.readu_u32(pe.mmap_va(l_0_3, 4), 1)
      if l_0_4 ~= 1162627398 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
