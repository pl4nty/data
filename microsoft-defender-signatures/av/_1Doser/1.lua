-- Threat: \xb01Doser
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if epcode[1] ~= 232 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData <= 4182 then
  return mp.CLEAN
end
if 4182 >= pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
if epcode[4] ~= 0 then
  return mp.CLEAN
end
if epcode[5] ~= 0 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\232\000\000\000\000\189\n\000A\000\247\221X\003\232\v",
    xray_type = 13,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000\189\n\016@\000\247\221X\003\232\v",
    xray_type = 13,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\000\000\000\000\144\189\n\016@\000\247\221X\003\232",
    xray_type = 13,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 3, -2, 0, 2048)
