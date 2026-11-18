-- Threat: !InfrastructureShared
-- Name: 73787d288a7c
-- Type: 21

local l_0_0 = mp.readu_u32(pe.mmap_va(mp.readu_u32(pe.mmap_va(hstrlog[1].VA + 11, 4), 1), 4), 1)
local l_0_1 = pe.get_api_id(l_0_0)
if l_0_1 == 137326890 then
  local l_0_2 = mp.readu_u32(pe.mmap_va(hstrlog[1].VA + 5, 4), 1)
  local l_0_3 = mp.utf16to8(pe.mmap_va(l_0_2, 12))
  if l_0_3 == "12345\000" then
    l_0_2 = mp.readu_u32(pe.mmap_va(hstrlog[1].VA + 16, 4), 1)
    l_0_3 = mp.utf16to8(pe.mmap_va(l_0_2, 14))
    if l_0_3 == "string\000" then
      l_0_2 = mp.readu_u32(pe.mmap_va(hstrlog[1].VA + 27, 4), 1)
      l_0_3 = pe.mmap_va(l_0_2, 6)
      if l_0_3 == "12345\000" then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
