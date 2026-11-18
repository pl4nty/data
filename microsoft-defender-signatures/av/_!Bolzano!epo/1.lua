-- Threat: \xb0!Bolzano!epo
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if pehdr.Machine < 332 then
  return mp.CLEAN
end
if pehdr.Machine > 335 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 2600 then
  return mp.CLEAN
end
if 2600 > pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
if not mp.bitand(pesecs[pehdr.NumberOfSections].SizeOfRawData, 15) == 0 then
  return mp.CLEAN
end
if not mp.bitand(pesecs[pehdr.NumberOfSections].VirtualSize, 15) == 0 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\190H\n\000\000\003\245\191\197\f\000\000\003\253\185\n\000\000\000\243\165\139\157p\n\000\000f\199\003`\184",
    xray_type = 0,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232X\t\000\000\190\149\v\000\000\003\245\191\200\016\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232B\t\000\000\190{\v\000\000\003\245\191\180\016\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232c\n\000\000\1909\r\000\000\003\245\191\004\018\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\135\t\000\000\190\196\v\000\000\003\245\191\252\016\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\006\n\000\000\190\152\f\000\000\003\245\191\176\018\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\220\a\000\000\1909\n\000\000\003\245\191\185\f\000",
    xray_type = 0,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\177\a\000\000\190\005\n\000\000\003\245\191\r\r\000",
    xray_type = 0,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232-\t\000\000\190f\v\000\000\003\245\191\160\016\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\2326\014\000\000\191\000\f\001\000\185\000\001\000\0003\192\243\174u\f\190\143\016\000\000\191\000\000\240w\235",
    xray_type = 2,
    bytes_to_decrypt = 0
  },
  {
    sig = "\2328\014\000\000\191\000\f\001\000\185\000\001\000\0003\192\243\174u\f\190\145\016\000\000\191\000\000\240w\235",
    xray_type = 2,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232\213\014\000\000\191\000\f\001\000\185\000\001\000\0003\192\243\174u\f\190-\017\000\000\191\000\000\240w\235",
    xray_type = 2,
    bytes_to_decrypt = 0
  },
  {
    sig = "\232i\t\000\000\190\166\v\000\000\003\245\191\216\016\000\000\003\253\185,\000\000\000\252\243\165\139\189V\f\000",
    xray_type = 2,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 13, -1, -8192, -4096)
