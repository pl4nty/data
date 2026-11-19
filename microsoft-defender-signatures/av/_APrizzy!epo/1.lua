-- Threat: \xb0APrizzy!epo
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.epscn_islast == false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 12960 then
  return mp.CLEAN
end
if 12960 > pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "_\131\199\024\139\015\137\141\1613\000\000\139O\004\137\141\1653\000\000f\171f\175\180\238\137\a\006\030\015",
    xray_type = 8,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -2, -13024, -12512)
