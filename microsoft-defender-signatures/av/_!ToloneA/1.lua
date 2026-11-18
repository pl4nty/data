-- Threat: \xb0!Tolone.A
-- Type: 8

if mp.readu_u16(headerpage, 29) ~= 22340 then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData <= 4096 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "hMUTE\144\002\006hSYS_\144\002\006\137\144\002\a\232\144\000",
    xray_type = 9,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, 0, -16384, -1)
