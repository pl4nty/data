-- Threat: !InfrastructureShared
-- Name: 3e788be217b9
-- Type: 21
-- Flags: 1

if pehdr.NumberOfSections == 3 and pesecs[1].SizeOfRawData > 151552 and pehdr.DataDirectory[2].Size > 74 and pehdr.DataDirectory[2].Size < 90 and peattributes.isexe and hstrlog[1].matched then
  mp.set_mpattribute("LowFi:Kurei_PNG")
  mp.readprotection(false)
  local l_0_0 = pe.foffset_va(hstrlog[1].VA)
  local l_0_1 = {3058425074, 8654206}
  local l_0_2 = mp.readfile(l_0_0 + 2000, 1168)
  local l_0_3 = mp.crc32(-1, l_0_2, 1, 0)
  if l_0_3 == l_0_1[1] then
    l_0_2 = mp.readfile(l_0_0 + 61440, 1168)
    l_0_3 = mp.crc32(-1, l_0_2, 1, 0)
    if l_0_3 == l_0_1[2] then
      return mp.INFECTED
    end
    return mp.LOWFI
  end
  return mp.LOWFI
end
return mp.CLEAN
