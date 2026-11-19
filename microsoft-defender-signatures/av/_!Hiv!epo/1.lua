-- Threat: \xb0!Hiv!epo
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if headerpage[41] ~= 231 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData <= 16384 then
  return mp.CLEAN
end
if 16384 >= pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\214\2322\022\000\000\137\133\200\t\000\000\232G\018\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\214\232/\022\000\000\137\133\195\t\000\000\232B\018\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\214\232\135\023\000\000\137\133\191\n\000\000\232\153\019\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  },
  {
    sig = "\214\232;\022\000\000\137\133\200\t\000\000\232G\018\000",
    xray_type = 1,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 4, -1, 0, -1)
