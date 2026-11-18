-- Threat: !InfrastructureShared
-- Name: ca785f1a193e
-- Type: 21

if peattributes.isvbpcode and (peattributes.hasappendeddata or pesecs[pehdr.NumberOfSections].SizeOfRawData > 24576) then
  function Check_Padding(l_1_0)
    local l_1_1, l_1_2 = string.find(l_1_0, "[\002-\t]+")
    
    if l_1_1 ~= nil and 16 < l_1_2 - l_1_1 then
      return 1
    end
    l_1_1, l_1_2 = string.find(l_1_0, "^%z%z%z%z+")
    if l_1_1 ~= nil and 160 < l_1_2 - l_1_1 then
      return 1
    end
    return 0
  end
  
  mp.readprotection(false)
  local l_0_0 = pehdr.AddressOfEntryPoint + pehdr.ImageBase
  local l_0_1 = mp.readu_u32(pe.mmap_va(l_0_0, 5), 2)
  if mp.readu_u32(pe.mmap_va(l_0_1, 4), 1) ~= 557138518 then
    return mp.CLEAN
  end
  local l_0_2 = mp.readu_u16(pe.mmap_va(l_0_1 + 68, 2), 1)
  local l_0_3 = mp.readu_u32(pe.mmap_va(l_0_1 + 48, 4), 1)
  local l_0_4 = mp.readu_u32(pe.mmap_va(l_0_3 + 4, 4), 1)
  local l_0_5 = mp.readu_u16(pe.mmap_va(l_0_4 + 46, 2), 1)
  if l_0_5 - l_0_2 == 7 or l_0_5 - l_0_2 == 8 then
    mp.set_mpattribute("HSTR:VirTool:Win32/VBInject.gen!MJ")
    local l_0_6 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
    local l_0_7 = pe.foffset_va(pehdr.ImageBase + (pehdr.SizeOfImage - 1)) + 1
    if l_0_6 ~= l_0_7 then
      l_0_6 = l_0_7
    end
    local l_0_8 = mp.getfilesize() - l_0_6
    if l_0_8 <= 0 and (pesecs[1].SizeOfRawData >= 69632 or pesecs[pehdr.NumberOfSections].SizeOfRawData >= 65536) then
      local l_0_9 = pesecs[pehdr.NumberOfSections].PointerToRawData
      local l_0_10 = mp.readfile(l_0_9, 848)
      if string.find(l_0_10, "%d%z%d%z%d%z%d%z%d%z%d%z%d%z%.%ze%zx%ze") then
        return mp.INFECTED
      end
      return mp.LOWFI
    end
    if l_0_8 < 8192 then
      return mp.CLEAN
    end
    local l_0_11 = mp.readfile(l_0_6, 224)
    local l_0_12, l_0_13 = string.find(l_0_11, "%d+")
    if l_0_12 ~= nil and 8 < l_0_13 - l_0_12 then
      return mp.INFECTED
    end
    if Check_Padding(l_0_11) == 1 then
      local l_0_14 = 12112
      if l_0_8 < l_0_14 then
        l_0_14 = l_0_8 - 16
      end
      l_0_11 = mp.readfile(l_0_6, l_0_14)
      l_0_12, l_0_13 = string.find(l_0_11, "%d%d%d%d+")
      if l_0_12 ~= nil and 8 < l_0_13 - l_0_12 then
        return mp.INFECTED
      end
    end
  end
end
return mp.LOWFI
