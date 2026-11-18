-- Threat: \xb0)Rever.27247
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.epscn_islast == false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 20480 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "P`\232\006\000\000\000\139d$\b\235\v3\210d\2552d\137",
    xray_type = 1,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, 4131, 4643)
