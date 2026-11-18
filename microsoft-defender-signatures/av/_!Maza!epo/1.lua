-- Threat: \xb0!Maza!epo
-- Type: 8

if pehdr.MinorImageVersion ~= 106 then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.lastscn_valign == false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 1024 then
  return mp.CLEAN
end
if 1024 > pesecs[pehdr.NumberOfSections].VirtualSize then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "`\141l$ \232\006\000\000\000\139d$\b\235'dg\2556\000\000dg\137&\000\000\232\000\000\000",
    xray_type = 0,
    bytes_to_decrypt = 0
  },
  {
    sig = "`\141l$ \232\t\000\000\000\139d$\b\235+\144\144\144dg\2556\000\000dg\137&\000\000\232",
    xray_type = 0,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 2, -1, -2048, -1024)
