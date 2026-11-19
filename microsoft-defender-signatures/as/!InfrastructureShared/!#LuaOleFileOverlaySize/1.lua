-- Threat: !InfrastructureShared
-- Name: !#Lua:OleFileOverlaySize
-- Type: 12
-- MpAttributes: RPF:OleFileHasOverlay & BM_OLE_FILE & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if l_0_0 < 4194304 then
  return mp.CLEAN
end
local l_0_1 = mp.get_mpattributevalue("RPF:OleFileHasOverlay")
if l_0_1 == nil or l_0_1 < 256 then
  return mp.CLEAN
end
local l_0_2 = l_0_0 - l_0_1
if 268435456 <= l_0_2 then
  mp.set_mpattribute("Lua:OLEOverlayGT256mb")
elseif 104857600 <= l_0_2 then
  mp.set_mpattribute("Lua:OLEOverlayGT100mb")
elseif 16777216 <= l_0_2 then
  mp.set_mpattribute("Lua:OLEOverlayGT16mb")
end
local l_0_3 = l_0_2 / l_0_1
if 1000 <= l_0_3 then
  mp.set_mpattribute("Lua:OLEOverlayGT1000xFileSize")
elseif 100 <= l_0_3 then
  mp.set_mpattribute("Lua:OLEOverlayGT100xFileSize")
elseif 10 <= l_0_3 then
  mp.set_mpattribute("Lua:OLEOverlayGT10xFileSize")
end
return mp.CLEAN
