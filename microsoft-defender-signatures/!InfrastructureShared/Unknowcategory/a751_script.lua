-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a751_luac 

-- params : ...
-- function num : 0
if peattributes.is_process or pehdr.NumberOfSections < 2 or pevars.epsec == 1 or pehdr.FileAlignment == 0 then
  return mp.CLEAN
end
if pevars.epsec > 0 and pehdr.AddressOfEntryPoint ~= (pesecs[pevars.epsec]).VirtualAddress then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC135: Unhandled construct in 'MakeBoolean' P3

if (not (mp.get_mpattribute)("pea_lastscn_executable") or not (mp.get_mpattribute)("pea_epatstartentrysect") or (epcode[1] == 104 and (((epcode[6] == 232 or epcode[6] == 144) and epcode[11] == 233) or epcode[16] ~= 85 or epcode[17] ~= 139 or epcode[18] ~= 236 or epcode[6] ~= 232 or epcode[7] ~= 5 or epcode[8] ~= 0 or epcode[9] ~= 0 or epcode[10] ~= 0 or epcode[11] == 0) and (mp.bitand)(epcode[15], 240) ~= 240) or (pesecs[pevars.epsec]).SizeOfRawData ~= (pesecs[pevars.epsec]).VirtualSize or (pesecs[pevars.epsec]).SizeOfRawData % pehdr.FileAlignment > 0) then
  return mp.INFECTED
end
return mp.CLEAN

