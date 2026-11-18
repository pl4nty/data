-- Threat: !InfrastructureShared
-- Name: 14878e2e120be
-- Type: 21

if pehdr.NumberOfSections < 1 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\255\208\131\236\b\199D$\016@\000\000\000\199D$\f\0000\000\000",
    xray_type = 11,
    bytes_to_decrypt = 0
  }
}
if pesecs[1].SizeOfRawData >= 65536 then
  return mp.CLEAN
end
return pe.xray_block(l_0_0, 1, 0, 0, pesecs[1].SizeOfRawData)
