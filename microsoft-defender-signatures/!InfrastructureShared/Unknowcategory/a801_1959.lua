-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a801_1959.luac 

-- params : ...
-- function num : 0
if peattributes.is_process or pehdr.NumberOfSections < 2 or (pesecs[pehdr.NumberOfSections]).SizeOfRawData <= 1024 or (pesecs[1]).Name ~= ".text" then
  return mp.CLEAN
end
if ((epcode[2] == 131 and epcode[3] == 236 and epcode[5] == 232 and epcode[11] == 131 and epcode[12] == 196 and epcode[13] == 40 and epcode[14] == 233) or epcode[2] ~= 137 or epcode[7] ~= 72 or epcode[11] ~= 51 or epcode[13] == 232) and (mp.get_mpattribute)("pea_no_relocs") and (mp.get_mpattribute)("pea_lastscn_executable") and (mp.get_mpattribute)("pea_lastscn_writable") and (mp.get_mpattribute)("pea_no_security") and (mp.get_mpattribute)("pea_epinfirstsect") and (mp.get_mpattribute)("pea_isexe") and (mp.get_mpattribute)("pea_lastscn_vfalign") then
  if (pesecs[pehdr.NumberOfSections]).VirtualSize % 4096 ~= 0 then
    return mp.CLEAN
  end
  if (pesecs[pehdr.NumberOfSections]).Name == ".reloc" and (pesecs[pehdr.NumberOfSections]).SizeOfRawData + 4096 == (pesecs[pehdr.NumberOfSections]).VirtualSize then
    return mp.INFECTED
  end
  if (pesecs[pehdr.NumberOfSections]).Name ~= ".rsrc" then
    return mp.CLEAN
  end
  local l_0_0 = nil
  local l_0_1 = 0
  if hstrlog[9] and (hstrlog[9]).matched then
    l_0_0 = hstrlog[9]
    l_0_1 = l_0_0.VA
  end
  if hstrlog[8] and (hstrlog[8]).matched then
    l_0_0 = hstrlog[8]
    if l_0_1 < l_0_0.VA then
      l_0_1 = l_0_0.VA
    end
  end
  if hstrlog[7] and (hstrlog[7]).matched then
    l_0_0 = hstrlog[7]
    if l_0_1 < l_0_0.VA then
      l_0_1 = l_0_0.VA
    end
  end
  if hstrlog[6] and (hstrlog[6]).matched then
    l_0_0 = hstrlog[6]
    if l_0_1 < l_0_0.VA then
      l_0_1 = l_0_0.VA
    end
  end
  if hstrlog[5] and (hstrlog[5]).matched then
    l_0_0 = hstrlog[5]
    if l_0_1 < l_0_0.VA then
      l_0_1 = l_0_0.VA
    end
  end
  if hstrlog[4] and (hstrlog[4]).matched then
    l_0_0 = hstrlog[4]
    if l_0_1 < l_0_0.VA then
      l_0_1 = l_0_0.VA
    end
  end
  if hstrlog[3] and (hstrlog[3]).matched then
    l_0_0 = hstrlog[3]
    if l_0_1 < l_0_0.VA then
      l_0_1 = l_0_0.VA
    end
  end
  if l_0_1 == 0 then
    return mp.CLEAN
  end
  local l_0_2 = (pe.foffset_va)(l_0_1)
  if l_0_2 == 0 then
    return mp.CLEAN
  end
  local l_0_3 = (pesecs[pehdr.NumberOfSections]).SizeOfRawData + (pesecs[pehdr.NumberOfSections]).PointerToRawData
  if (pesecs[pehdr.NumberOfSections]).PointerToRawData < l_0_2 and l_0_2 < l_0_3 then
    l_0_2 = l_0_3 - l_0_2
    if l_0_2 > 4096 then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

