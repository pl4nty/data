-- Threat: !InfrastructureShared
-- Name: !#LUA:PSHexToBin
-- Type: 13
-- Includes: ConversionToBinary_fastHex2Bin
-- MpAttributes: SCRIPT:PS.HexBytes & ALF:PowerShell_SuspiciousImports

local l_0_0 = mp.getfilesize()
if 8192 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(tostring(headerpage))
l_0_1 = string.gsub(l_0_1, " ", "")
local l_0_2 = ""
local l_0_3 = 0
for l_0_4 in string.gmatch(l_0_1, "%(?(0x[0-9A-Fa-f]+,0x[0-9A-Fa-f]+,0x[0-9A-Fa-f]+,.-)%)?;") do
  l_0_4 = string.gsub(l_0_4, "0x", "")
  l_0_4 = string.gsub(l_0_4, ",", "")
  l_0_2 = l_0_2 .. l_0_4
  l_0_3 = l_0_3 + 1
end
if 1 < l_0_3 or string.len(l_0_2) > 256 then
  mp.vfo_add_buffer(fastHex2Bin(l_0_2, "([0-9A-Fa-f][0-9A-Fa-f])"), "[hextobin]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.CLEAN
