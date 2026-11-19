-- Threat: \xac!Lipgame.D
-- Type: 8

if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].VirtualSize > 24576 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].VirtualSize < 20480 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData < 23040 then
  return mp.CLEAN
end
if 24576 < pesecs[pevars.epsec].SizeOfRawData then
  return mp.CLEAN
end
if mp.bitand(pesecs[pevars.epsec].Characteristics, 3758096416) ~= 3758096416 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "j\025j\000\255\214\139}\b\128'\000\133\192t\017",
    xray_type = 3,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, 0, 0, -1)
