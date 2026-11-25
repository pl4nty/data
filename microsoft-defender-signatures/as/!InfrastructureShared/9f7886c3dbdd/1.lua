-- Threat: !InfrastructureShared
-- Name: 9f7886c3dbdd
-- Type: 21

if peattributes and peattributes.is_process then
  return mp.CLEAN
end
if not (pesecs and pehdr and peattributes) or not peattributes.isexe then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:TopLevelUnsigned") then
  return mp.CLEAN
end
local l_0_0 = pehdr.NumberOfSections
if not l_0_0 or l_0_0 <= 0 then
  return mp.CLEAN
end
local l_0_1 = pesecs[l_0_0]
if not (l_0_1 and l_0_1.PointerToRawData) or not l_0_1.SizeOfRawData then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if not l_0_2 or not (0 < l_0_2) then
  return mp.CLEAN
end
local l_0_3 = l_0_1.PointerToRawData + l_0_1.SizeOfRawData
if l_0_3 <= 0 then
  return mp.CLEAN
end
if l_0_2 > l_0_3 - 256 then
  mp.set_mpattribute("LUA:Virus:Win32/Expiro.HAD2!MTB")
  return mp.INFECTED
end
return mp.CLEAN
