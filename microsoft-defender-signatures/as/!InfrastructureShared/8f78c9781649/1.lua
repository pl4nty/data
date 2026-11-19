-- Threat: !InfrastructureShared
-- Name: 8f78c9781649
-- Type: 21

if (hstrlog[1].matched or hstrlog[2].matched or hstrlog[3] or hstrlog[4]) and pehdr.NumberOfSections < 6 and 3 <= pehdr.NumberOfSections then
  local l_0_0 = 1280
  local l_0_1 = 256
  local l_0_2 = 8192
  if pesecs[1].Name == ".text" and pesecs[1].VirtualSize > l_0_0 + l_0_1 and l_0_2 < pesecs[3].VirtualSize then
    local l_0_3 = pe.mmap_rva(pesecs[1].VirtualAddress + l_0_1, l_0_0)
    local l_0_4 = true
    local l_0_5 = 0
    local l_0_6 = 0
    for l_0_7 = 1, 8 do
      local l_0_8 = mp.readu_u32(l_0_3, l_0_7)
      if 0 < mp.bitand(l_0_8, 65535) and mp.bitand(l_0_8, 4294901760) == 0 then
        l_0_6 = l_0_7
        break
      end
    end
    for l_0_9 = l_0_6, l_0_0 - 4 - l_0_6, 4 do
      local l_0_10 = mp.readu_u32(l_0_3, l_0_9)
      if 0 < mp.bitand(l_0_10, 65535) then
        l_0_5 = l_0_5 + 1
      end
      if 0 < mp.bitand(l_0_10, 4294901760) then
        l_0_4 = false
        break
      end
    end
    if l_0_4 and l_0_5 > l_0_0 / 4 / 2 then
      local l_0_11 = pe.foffset_rva(pesecs[3].VirtualAddress + pesecs[3].VirtualSize - l_0_2)
      mp.readprotection(false)
      local l_0_12 = mp.readfile(l_0_11, l_0_2)
      local l_0_13 = -1
      for l_0_14 = l_0_2 - 4, 1, -1 do
        local l_0_15 = mp.readu_u32(l_0_12, l_0_14)
        if l_0_15 == 720895 or l_0_15 == 655359 then
          l_0_13 = l_0_11 + l_0_14
          break
        end
      end
      if l_0_13 ~= -1 then
        local l_0_16 = mp.readfile(0, mp.getfilesize())
        mp.writeu_u32(l_0_16, l_0_13, 1)
        mp.vfo_add_buffer(l_0_16, "xorgetti_patched", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      end
    end
  end
end
return mp.CLEAN
