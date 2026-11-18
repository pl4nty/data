-- Threat: !InfrastructureShared
-- Name: 20c78307ffc87
-- Type: 21

local l_0_0
if hstrlog[2] and hstrlog[2].matched then
  l_0_0 = hstrlog[2].VA
elseif hstrlog[3] and hstrlog[3].matched then
  l_0_0 = hstrlog[3].VA
elseif hstrlog[4] and hstrlog[4].matched then
  l_0_0 = hstrlog[4].VA
elseif hstrlog[5] and hstrlog[5].matched then
  l_0_0 = hstrlog[5].VA
elseif hstrlog[6] and hstrlog[6].matched then
  l_0_0 = hstrlog[6].VA
elseif hstrlog[7] and hstrlog[7].matched then
  l_0_0 = hstrlog[7].VA
elseif hstrlog[8] and hstrlog[8].matched then
  l_0_0 = hstrlog[8].VA
elseif hstrlog[9] and hstrlog[9].matched then
  l_0_0 = hstrlog[9].VA
elseif hstrlog[10] and hstrlog[10].matched then
  l_0_0 = hstrlog[10].VA
elseif hstrlog[11] and hstrlog[11].matched then
  l_0_0 = hstrlog[11].VA
elseif hstrlog[12] and hstrlog[12].matched then
  l_0_0 = hstrlog[12].VA
elseif hstrlog[13] and hstrlog[13].matched then
  l_0_0 = hstrlog[13].VA
elseif hstrlog[14] and hstrlog[14].matched then
  l_0_0 = hstrlog[14].VA
elseif hstrlog[15] and hstrlog[15].matched then
  l_0_0 = hstrlog[15].VA
elseif hstrlog[16] and hstrlog[16].matched then
  l_0_0 = hstrlog[16].VA
elseif hstrlog[17] and hstrlog[17].matched then
  l_0_0 = hstrlog[17].VA
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0 - pehdr.ImageBase
if l_0_1 < pesecs[pehdr.NumberOfSections].VirtualAddress or l_0_1 >= pesecs[pehdr.NumberOfSections].VirtualAddress + pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
if (epcode[1] == 232 and epcode[6] == 233 and epcode[10] == 255 or epcode[1] == 85 and epcode[2] == 139 and epcode[3] == 236 and (epcode[4] == 106 or epcode[4] == 131) or epcode[1] == 139 and epcode[2] == 255 and epcode[3] == 85 and epcode[4] == 139 and epcode[5] == 236) and pesecs[1].Name == ".text" and pesecs[pehdr.NumberOfSections].Name == ".reloc" and mp.get_mpattribute("pea_no_relocs") and mp.get_mpattribute("pea_lastscn_executable") and mp.get_mpattribute("pea_lastscn_writable") and mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("pea_lastscn_vfalign") then
  local l_0_2 = pe.foffset_va(l_0_0)
  if l_0_2 <= 0 or l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = mp.getfilesize()
  local l_0_4 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
  if l_0_3 > l_0_4 and 100 < l_0_3 - l_0_4 then
    return mp.CLEAN
  elseif l_0_3 < l_0_4 then
    return mp.CLEAN
  elseif l_0_2 < l_0_3 and l_0_3 - l_0_2 < 4096 then
    return mp.CLEAN
  end
  local l_0_5 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].RVA
  if l_0_5 ~= 0 and l_0_2 < l_0_5 and l_0_5 - l_0_2 < 4608 then
    return mp.CLEAN
  end
  local l_0_6 = 0
  local l_0_7 = l_0_4 - 32
  mp.readprotection(false)
  for l_0_8 = 1, 8 do
    local l_0_9 = l_0_2 + 512 + (l_0_8 - 1) * 512
    if l_0_7 <= l_0_9 then
      break
    end
    local l_0_10 = mp.readfile(l_0_9, 16)
    if #l_0_10 == 16 and not l_0_10:find(string.rep("\000", 16), 1, true) then
      l_0_6 = 1
      break
    end
  end
  mp.readprotection(true)
  if l_0_6 == 1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
