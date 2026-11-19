-- Threat: !InfrastructureShared
-- Name: !#LUA_VirTool:Win32/Obfuscator.ACV_overlaysize
-- Type: 10
-- MpAttributes: MpAPILimitReached | MpHasExpensiveLoop

local l_0_0 = mp.getfilesize()
if 208000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
local l_0_2 = l_0_0 - l_0_1
if l_0_2 == 54133 or l_0_2 == 53941 or l_0_2 == 55632 or l_0_2 == 55640 then
  pe.set_peattribute("deep_analysis", true)
  pe.set_peattribute("disable_apicall_limit", true)
  pe.reemulate()
  return mp.INFECTED
end
return mp.CLEAN
