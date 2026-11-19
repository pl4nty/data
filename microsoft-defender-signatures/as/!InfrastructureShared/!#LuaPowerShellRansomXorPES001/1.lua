-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell.RansomXorPE.S001
-- Type: 12
-- MpAttributes: BM_TEXT_FILE | Nscript:Type_ps

local l_0_0 = mp.getfilesize()
if l_0_0 < 20480 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfooter(0, 4096)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = tostring(l_0_1)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, "bxor", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3 = mp.readheader(0, 4096)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = ""
for l_0_5 in string.gmatch(l_0_2, "bxor%s+(0x%x%x)") do
  if l_0_5 ~= nil and l_0_5 ~= "" then
    for l_0_6 in string.gmatch(l_0_3, "(0x%x%x)") do
      if l_0_6 ~= nil and l_0_6 ~= "" then
        l_0_4 = l_0_4 .. string.char(mp.bitxor(l_0_6, l_0_5))
      end
    end
  end
end
if l_0_4 ~= nil and l_0_4 ~= "" then
  l_0_4 = string.lower(l_0_4)
  if string.find(l_0_4, "0x4d,0x5a,0x90,0x00,0x03,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0xff,0xff", 1, true) ~= nil then
    mp.set_mpattribute("Lua:PEembedViaXOR.S001")
  end
end
local l_0_7 = ""
for l_0_8 in string.gmatch(l_0_2, "bxor%s+(%d?%d%d?)") do
  if l_0_8 ~= nil and l_0_8 ~= "" then
    for l_0_9 in string.gmatch(l_0_3, "(0x%x%x)") do
      if l_0_9 ~= nil and l_0_9 ~= "" then
        l_0_7 = l_0_7 .. string.char(mp.bitxor(l_0_9, l_0_8))
      end
    end
  end
end
if l_0_7 ~= nil and l_0_7 ~= "" then
  l_0_7 = string.lower(l_0_7)
  if string.find(l_0_7, "0x4d,0x5a,0x90,0x00,0x03,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0xff,0xff", 1, true) ~= nil then
    mp.set_mpattribute("Lua:PEembedViaXOR.S001")
  end
end
return mp.CLEAN
