-- Threat: \xcc!CeeInject.gen!KK
-- Type: 9

if mp.getfilesize() < 4096 or mp.getfilesize() > 5242880 then
  return mp.CLEAN
end
if peattributes.packed == true then
  return mp.CLEAN
end
if peattributes.packersigmatched == true then
  return mp.CLEAN
end
if peattributes.epinfirstsect == false then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 1 then
  return mp.CLEAN
end
if pehdr.Subsystem ~= 3 then
  return mp.CLEAN
end
if pehdr.TimeDateStamp ~= 0 then
  return mp.CLEAN
end
if pehdr.SizeOfCode ~= 4 then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 1634891822 then
  return mp.CLEAN
end
if pesecs[1].Characteristics ~= 3758096608 then
  return mp.CLEAN
end
if epcode[1] ~= 195 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "h\134W\r\000h\136N\r\000\232\026\000\000\000\137E\252h\250\1394\000h",
    xray_type = 4,
    bytes_to_decrypt = 0
  },
  {
    sig = "h\000\000\000\134\000\000\000W\000\000\000\r\000\000\000\000\000\000\000h\000\000\000\136\000\000\000N\000\000\000",
    xray_type = 4,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 2, -1, 0, -1)
