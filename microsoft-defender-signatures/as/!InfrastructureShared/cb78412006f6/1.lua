-- Threat: !InfrastructureShared
-- Name: cb78412006f6
-- Type: 21

if peattributes.ismsil == false then
  return mp.CLEAN
end
local l_0_0 = pe.get_netmetadata()
if l_0_0 == nil then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = {
  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  -1,
  -1
}
if hstrlog[1].matched == true then
  l_0_1[1] = pe.mmap_va(hstrlog[1].VA + 4, 4)
end
if hstrlog[2].matched == true then
  l_0_1[2] = pe.mmap_va(hstrlog[2].VA + 4, 4)
end
if hstrlog[3].matched == true then
  l_0_1[3] = pe.mmap_va(hstrlog[3].VA + 4, 4)
end
if hstrlog[4].matched == true then
  l_0_1[4] = pe.mmap_va(hstrlog[4].VA + 4, 4)
end
if hstrlog[5].matched == true then
  l_0_1[5] = pe.mmap_va(hstrlog[5].VA + 5, 4)
end
if hstrlog[6].matched == true then
  l_0_1[6] = pe.mmap_va(hstrlog[6].VA + 5, 4)
end
if hstrlog[7].matched == true then
  l_0_1[7] = pe.mmap_va(hstrlog[7].VA + 5, 4)
end
if hstrlog[8].matched == true then
  l_0_1[8] = pe.mmap_va(hstrlog[8].VA + 5, 4)
end
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3 ~= -1 then
    local l_0_4 = mp.readu_u32(l_0_3, 1)
    local l_0_5 = l_0_0.strheap_RVA + pe.metadata_decode(l_0_4, 2)
    local l_0_6 = pe.mmap_rva(l_0_5, 10)
    if string.find(l_0_6, "Initialize", 1, true) ~= nil then
      local l_0_7 = pe.metadata_decode(l_0_4, 1)
      l_0_5 = l_0_0.strheap_RVA + pe.metadata_decode(l_0_7, 2)
      local l_0_8 = l_0_0.strheap_RVA + pe.metadata_decode(l_0_7, 3)
      l_0_6 = pe.mmap_rva(l_0_5, 12)
      local l_0_9 = pe.mmap_rva(l_0_8, 22)
      if string.find(l_0_6, "ScriptObject", 1, true) ~= nil and string.find(l_0_9, "System.Windows.Browser", 1, true) ~= nil then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
