-- Threat: !InfrastructureShared
-- Name: !#Lua:OverlayChk
-- Type: 10
-- MpAttributes: pea_hasappendeddata

local l_0_0 = mp.getfilesize()
if l_0_0 < 102400 then
  return mp.CLEAN
end
local l_0_1 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
if 102400 < l_0_0 - l_0_1 then
  mp.set_mpattribute("Lua:OverlayGT100")
  return mp.CLEAN
end
mp.set_mpattribute("Lua:OverlayLE100")
return mp.CLEAN
