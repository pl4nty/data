-- Threat: \xb0!Neverdie!epo
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.lastscn_vfalign == false then
  return mp.CLEAN
end
if peattributes.lastscn_eqsizes == false then
  return mp.CLEAN
end
if mp.bitand(pesecs[1].Characteristics, 2147483648) == 0 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\232\000\000\000\000]\129\237\005\016@\000\141\181'\023@\000\141\1890\023@\000\185\b\000\000\000\144\243\164",
    xray_type = 0,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232'\000\000\000\139\133F\023@\0001\133\213\023@\000\235&\144\144\144\232\017\000\000\000\139\133J\023@",
    xray_type = 0,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\v\000\000\000\139d$\b\232Y\000\000\000\235B3\219d\2553d\137#R\015\001L$\254Z\131",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\v\000\000\000\139d$\b\232Z\000\000\000\235B3\219d\2553d\137#R\015\001L$\254Z\131",
    xray_type = 1,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 4, -1, -4096, -256)
