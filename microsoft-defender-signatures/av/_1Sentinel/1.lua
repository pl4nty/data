-- Threat: \xb01Sentinel
-- Type: 8

if mp.readu_u16(headerpage, 57) ~= 27756 then
  return mp.CLEAN
end
if mp.bitand(pesecs[pehdr.NumberOfSections].Characteristics, 2684354592) ~= 2684354592 then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.lastscn_valign == false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData <= 10240 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "U\232\000\000\000\000]\129\237\" @\000\141\133^ @\000Pdg\2556\000\000dg\137&\000\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, -10240, -9216)
