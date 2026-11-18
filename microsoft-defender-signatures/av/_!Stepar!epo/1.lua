-- Threat: \xb0!Stepar!epo
-- Type: 8

if pehdr.Subsystem == 3 then
  return mp.CLEAN
end
if pehdr.SizeOfStackReserve < 65536 then
  return mp.CLEAN
end
if 65536 > pehdr.SizeOfStackCommit then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if mp.bitand(pesecs[pevars.epsec].Characteristics, 536870912) ~= 536870912 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData <= 8192 then
  return mp.CLEAN
end
if 8192 >= pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.packed ~= false then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\232\000\000\000\000]\232\232\003\000\000jEY\141\181\0064\000\000\232\f\004\000\000\141\133\188\000\000\000T",
    xray_type = 17,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\232w\004\000\000jEY\141\181\1975\000\000\232\155\004\000\000\141\133\188\000\000\000T",
    xray_type = 17,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\232w\004\000\000jEY\141\181\1985\000\000\232\155\004\000\000\141\133\188\000\000\000T",
    xray_type = 17,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\232-\004\000\000jEY\141\181\2125\000\000\232Q\004\000\000\141\133\188\000\000\000T",
    xray_type = 17,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\232w\004\000\000jEY\141\181\0307\000\000\232\155\004\000\000\141\133\188\000\000\000T",
    xray_type = 17,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\232w\004\000\000jEY\141\181(7\000\000\232\155\004\000\000\141\133\188\000\000\000T",
    xray_type = 18,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\232\188\004\000\000jEY\141\181\1977\000\000\232\224\004\000\000\141\133\188\000\000\000T",
    xray_type = 17,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\232\188\004\000\000jEY\141\181\0309\000\000\232\224\004\000\000\141\133\188\000\000\000T",
    xray_type = 17,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000]\232\188\004\000\000jEY\141\181(9\000\000\232\224\004\000\000\141\133\188\000\000\000T",
    xray_type = 18,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 9, -1, -40960, -12288)
