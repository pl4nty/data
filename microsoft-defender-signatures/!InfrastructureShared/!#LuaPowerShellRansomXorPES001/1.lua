-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPowerShellRansomXorPES001\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 20480 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfooter)(0, 4096)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = tostring(l_0_1)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if (string.find)(l_0_2, "bxor", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.readheader)(0, 4096)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = ""
for l_0_8 in (string.gmatch)(l_0_2, "bxor%s+(0x%x%x)") do
  if l_0_8 ~= nil and l_0_8 ~= "" then
    for l_0_12 in (string.gmatch)(l_0_3, "(0x%x%x)") do
      if l_0_12 ~= nil and l_0_12 ~= "" then
        l_0_4 = l_0_4 .. (string.char)((mp.bitxor)(l_0_12, l_0_8))
      end
    end
  end
end
if l_0_4 ~= nil and l_0_4 ~= "" then
  l_0_4 = (string.lower)(l_0_4)
  if (string.find)(l_0_4, "0x4d,0x5a,0x90,0x00,0x03,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0xff,0xff", 1, true) ~= nil then
    (mp.set_mpattribute)("Lua:PEembedViaXOR.S001")
  end
end
local l_0_13 = ""
for l_0_17 in (string.gmatch)(l_0_2, "bxor%s+(%d?%d%d?)") do
  if l_0_17 ~= nil and l_0_17 ~= "" then
    for l_0_21 in (string.gmatch)(l_0_3, "(0x%x%x)") do
      if l_0_21 ~= nil and l_0_21 ~= "" then
        l_0_13 = l_0_13 .. (string.char)((mp.bitxor)(l_0_21, l_0_17))
      end
    end
  end
end
if l_0_13 ~= nil and l_0_13 ~= "" then
  l_0_13 = (string.lower)(l_0_13)
  if (string.find)(l_0_13, "0x4d,0x5a,0x90,0x00,0x03,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0xff,0xff", 1, true) ~= nil then
    (mp.set_mpattribute)("Lua:PEembedViaXOR.S001")
  end
end
return mp.CLEAN

