-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell.TrojanXorPE.S001
-- Type: 13
-- MpAttributes: SCRIPT:PS.XorLoop

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = tostring(mp.readfooter(0, 4096))
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "bxor", 1, true) == nil then
  return mp.CLEAN
end
local l_0_2 = mp.readheader(0, 4096)
if l_0_2 == nil then
  return mp.CLEAN
end
for l_0_3 in string.gmatch(l_0_1, "bxor%s+(0x%x%x)") do
  if l_0_3 ~= nil and l_0_3 ~= "" then
    local l_0_4 = ""
    local l_0_5 = ""
    for l_0_6 in string.gmatch(l_0_2, "([A-Za-z0-9+/=]+)") do
      if l_0_6 ~= nil and string.len(l_0_6) > 100 then
        l_0_4 = MpCommon.Base64Decode(l_0_6)
        if l_0_4 ~= nil and l_0_4 ~= "" then
          for l_0_7 in l_0_4:gmatch(".") do
            l_0_5 = l_0_5 .. mp.bitxor(string.byte(l_0_7), l_0_3)
          end
        end
      end
    end
    if l_0_5 ~= nil and l_0_5 ~= "" then
      local l_0_8 = string.match(l_0_5, "^77902320000")
      if l_0_8 ~= nil and l_0_8 ~= "" then
        mp.set_mpattribute("Lua:ShellBytesXorInB64.S001")
      end
    end
    local l_0_9 = ""
    for l_0_10 in string.gmatch(l_0_2, "%((%d+,%d+,%d+,%d+,%d+,%d+,%d+,[%d,]+)") do
      if l_0_10 ~= nil and string.len(l_0_10) > 100 then
        for l_0_11 in l_0_10:gmatch("%d+") do
          l_0_9 = l_0_9 .. string.char(mp.bitxor(l_0_11, l_0_3))
        end
      end
    end
    if l_0_9 ~= nil and l_0_9 ~= "" then
      local l_0_12 = ""
      local l_0_13 = ""
      if string.find(l_0_9, "MZ", 1, true) ~= nil then
        l_0_12 = "Found"
      end
      if string.find(l_0_9, "This program cannot be run", 1, true) ~= nil then
        l_0_13 = "Found"
      end
      if l_0_12 ~= nil and l_0_13 ~= nil and l_0_12 ~= "" and l_0_13 ~= "" then
        mp.set_mpattribute("Lua:PEembedViaXOR.S002")
      end
    end
  end
end
for l_0_14 in string.gmatch(l_0_1, "bxor%s+(%d?%d%d?)") do
  if l_0_14 ~= nil and l_0_14 ~= "" then
    local l_0_15 = ""
    local l_0_16 = ""
    for l_0_17 in string.gmatch(l_0_2, "([A-Za-z0-9+/=]+)") do
      if l_0_17 ~= nil and string.len(l_0_17) > 100 then
        l_0_15 = MpCommon.Base64Decode(l_0_17)
        if l_0_15 ~= nil and l_0_15 ~= "" then
          for l_0_18 in l_0_15:gmatch(".") do
            l_0_16 = l_0_16 .. mp.bitxor(string.byte(l_0_18), l_0_14)
          end
        end
      end
    end
    if l_0_16 ~= nil and l_0_16 ~= "" then
      local l_0_19 = string.match(l_0_16, "^77902320000")
      if l_0_19 ~= nil and l_0_19 ~= "" then
        mp.set_mpattribute("Lua:ShellBytesXorInB64.S001")
      end
    end
    local l_0_20 = ""
    for l_0_21 in string.gmatch(l_0_2, "%((%d+,%d+,%d+,%d+,%d+,%d+,%d+,[%d,]+)") do
      if l_0_21 ~= nil and string.len(l_0_21) > 100 then
        for l_0_22 in l_0_21:gmatch("(%d+),") do
          l_0_20 = l_0_20 .. string.char(mp.bitxor(l_0_22, l_0_14))
        end
      end
    end
    if l_0_20 ~= nil and l_0_20 ~= "" then
      local l_0_23 = ""
      local l_0_24 = ""
      if string.find(l_0_20, "MZ", 1, true) ~= nil then
        l_0_23 = "Found"
      end
      if string.find(l_0_20, "This program cannot be run", 1, true) ~= nil then
        l_0_24 = "Found"
      end
      if l_0_23 ~= nil and l_0_24 ~= nil and l_0_23 ~= "" and l_0_24 ~= "" then
        mp.set_mpattribute("Lua:PEembedViaXOR.S002")
      end
    end
  end
end
return mp.CLEAN
