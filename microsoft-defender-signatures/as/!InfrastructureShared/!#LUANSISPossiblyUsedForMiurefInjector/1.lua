-- Threat: !InfrastructureShared
-- Name: !#LUA:NSISPossiblyUsedForMiurefInjector
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & IMPHASH:NSISSometimesUsedForInjector

if peattributes.isexe == false or peattributes.isdamaged or peattributes.arm_image or peattributes.hasappendeddata == false then
  return mp.CLEAN
end
if mp.get_mpattribute("HSTR:NSIS_Installer") == false and mp.get_mpattribute("HSTR:NSIS.gen!A") == false or mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = pehdr.NumberOfSections
if l_0_0 < 1 then
  return mp.CLEAN
end
local l_0_1 = pesecs[l_0_0].PointerToRawData + pesecs[l_0_0].SizeOfRawData
local l_0_2 = mp.getfilesize()
if l_0_1 > l_0_2 then
  return mp.CLEAN
end
local l_0_3 = l_0_2 - l_0_1
if l_0_3 < 94208 or 143360 < l_0_3 then
  return mp.CLEAN
end
return mp.INFECTED
