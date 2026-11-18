-- Threat: \xb0!Jolla.A
-- Type: 8

if pehdr.NumberOfSections ~= 1 then
  return mp.CLEAN
end
if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData <= 262144 then
  return mp.CLEAN
end
local l_0_0 = pesecs[pevars.epsec].VirtualSize - pesecs[pevars.epsec].SizeOfRawData
if l_0_0 ~= 0 then
  return mp.CLEAN
end
local l_0_1 = {
  {
    sig = "[Sf3\219f\129;ZMt\015f\129;MZt\b\129\235\000\016\000\000\235\231\232+\000\000\000GetProcAdd",
    xray_type = 4,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_1, 1, 0, 0, -1)
