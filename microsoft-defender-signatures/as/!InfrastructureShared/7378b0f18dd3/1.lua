-- Threat: !InfrastructureShared
-- Name: 7378b0f18dd3
-- Type: 21

local l_0_0 = 3
local l_0_1 = pevars.epsec
if hstrlog[1].matched and mp.HSTR_WEIGHT >= 2 then
  return mp.INFECTED
end
if mp.getfilesize() < 40960 or l_0_0 > pehdr.NumberOfSections then
  return mp.CLEAN
end
local l_0_2 = hstrlog[1].VA - pehdr.ImageBase
local l_0_3 = pesecs[l_0_0].VirtualAddress
local l_0_4 = pesecs[l_0_0].VirtualSize
local l_0_5 = pesecs[l_0_1].VirtualAddress
local l_0_6 = pesecs[l_0_1].VirtualSize
if l_0_2 >= l_0_3 and l_0_2 <= l_0_3 + l_0_4 or l_0_2 >= l_0_5 and l_0_2 <= l_0_5 + l_0_6 then
  return mp.INFECTED
end
if peattributes.epscn_islast == true and peattributes.lastscn_executable == true and mp.bitand(pesecs[pehdr.NumberOfSections].Characteristics, 3758096384) == 3758096384 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
  return mp.CLEAN
end
return mp.CLEAN
