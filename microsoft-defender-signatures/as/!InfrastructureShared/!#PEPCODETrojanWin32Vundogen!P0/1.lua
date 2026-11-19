-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Vundo.gen!P.0
-- Type: 8

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.packed ~= true then
  return mp.CLEAN
end
if peattributes.hasexports == true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if pehdr.SizeOfHeaders ~= 4096 then
  return mp.CLEAN
end
if pehdr.NumberOfSections < 5 then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 6 then
  return mp.CLEAN
end
if pehdr.ImageBase ~= 268435456 then
  return mp.CLEAN
end
if pehdr.Subsystem ~= 2 then
  return mp.CLEAN
end
if pehdr.FileAlignment ~= 512 then
  return mp.CLEAN
end
if pehdr.SizeOfStackReserve ~= 1048576 then
  return mp.CLEAN
end
if 4096 >= pehdr.SizeOfCode then
  return mp.CLEAN
end
if pehdr.SizeOfCode >= 524288 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData <= 0 then
  return mp.CLEAN
end
if 524288 <= pesecs[pevars.epsec].SizeOfRawData then
  return mp.CLEAN
end
local l_0_0 = pehdr.SizeOfCode - pesecs[pevars.epsec].SizeOfRawData
if mp.bitand(l_0_0, 2147483648) == 2147483648 then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[2].RVA then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size >= 1536 then
  return mp.CLEAN
end
if pehdr.DataDirectory[5].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[5].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[10].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[10].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[12].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[12].Size ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
