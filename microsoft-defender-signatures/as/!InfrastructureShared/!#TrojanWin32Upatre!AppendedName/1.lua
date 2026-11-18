-- Threat: !InfrastructureShared
-- Name: !#Trojan:Win32/Upatre!AppendedName
-- Type: 10

if not peattributes.isexe then
  return mp.CLEAN
end
if not peattributes.hasappendeddata then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 65536 < l_0_0 then
  return mp.CLEAN
end
if l_0_0 < 4096 then
  return mp.CLEAN
end
local l_0_1 = pehdr.NumberOfSections
local l_0_2 = pesecs[l_0_1].PointerToRawData + pesecs[l_0_1].SizeOfRawData
local l_0_3 = l_0_0 - l_0_2
if 4096 < l_0_3 then
  return mp.CLEAN
end
if footerpage[4087] ~= 46 then
  return mp.CLEAN
end
if (footerpage[4089] ~= 115 or footerpage[4091] ~= 99 or footerpage[4093] ~= 114) and (footerpage[4089] ~= 83 or footerpage[4091] ~= 67 or footerpage[4093] ~= 82) and (footerpage[4089] ~= 101 or footerpage[4091] ~= 120 or footerpage[4093] ~= 101) and (footerpage[4089] ~= 69 or footerpage[4091] ~= 88 or footerpage[4093] ~= 69) then
  return mp.CLEAN
end
local l_0_4 = 4097 - l_0_3
if footerpage[l_0_4 + 2] ~= 58 or footerpage[l_0_4 + 4] ~= 92 then
  return mp.CLEAN
end
mp.set_mpattribute("LUA:UpatreAppendedName")
return mp.CLEAN
