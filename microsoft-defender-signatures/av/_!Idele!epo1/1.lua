-- Threat: \xb0!Idele!epo1
-- Type: 8

if doshdr.e_csum ~= 18772 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 2560 then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW == 1633964078 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\232\000\000\000\000]\129\237\161\016@\000\139D$ ",
    xray_type = 1,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, -2560, -1536)
