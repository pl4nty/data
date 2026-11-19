-- Threat: !InfrastructureShared
-- Name: !#Lua:FilenameHasUnicodeStyleChar.A
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan | RPF:AnyFileHasIOAVURL

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 20 then
  return mp.CLEAN
end
if string.find(l_0_0, "\240", 1, true) == nil and string.find(l_0_0, "\226", 1, true) == nil and string.find(l_0_0, "\239", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = {
  {
    name = "Bold",
    upper_start = 119808,
    lower_start = 119834
  },
  {
    name = "Italic",
    upper_start = 119860,
    lower_start = 119886
  },
  {
    name = "BoldItalic",
    upper_start = 119912,
    lower_start = 119938
  },
  {
    name = "Script",
    upper_start = 119964,
    lower_start = 119990
  },
  {
    name = "ScriptBold",
    upper_start = 120016,
    lower_start = 120042
  },
  {
    name = "Fraktur",
    upper_start = 120068,
    lower_start = 120094
  },
  {
    name = "FrakturBold",
    upper_start = 120172,
    lower_start = 120198
  },
  {
    name = "DoubleStruck",
    upper_start = 120120,
    lower_start = 120146
  },
  {
    name = "SansSerif",
    upper_start = 120224,
    lower_start = 120250
  },
  {
    name = "SansSerifBold",
    upper_start = 120276,
    lower_start = 120302
  },
  {
    name = "SansSerifItalic",
    upper_start = 120328,
    lower_start = 120354
  },
  {
    name = "SansSerifBoldItalic",
    upper_start = 120380,
    lower_start = 120406
  },
  {
    name = "Monospace",
    upper_start = 120432,
    lower_start = 120458
  },
  {
    name = "SquaredLatin",
    upper_start = 127280,
    lower_start = nil
  }
}
local l_0_2 = {
  {
    name = "CircledLatin",
    upper_start = 9398,
    lower_start = 9424
  },
  {
    name = "FullwidthLatin",
    upper_start = 65313,
    lower_start = 65345
  }
}

local function l_0_3(l_1_0, l_1_1, l_1_2, l_1_3)
  return (l_1_0 - 240) * 262144 + (l_1_1 - 128) * 4096 + (l_1_2 - 128) * 64 + (l_1_3 - 128)
end

local function l_0_4(l_2_0)
  local l_2_1 = {
    [120064] = "w",
    [120065] = "x",
    [120066] = "y",
    [120067] = "z"
  }
  if l_2_1[l_2_0] then
    return "FrakturAltForm", l_2_1[l_2_0]
  end
  for l_2_2, l_2_3 in ipairs(l_0_1) do
    if l_2_3.upper_start and l_2_0 >= l_2_3.upper_start and l_2_0 < l_2_3.upper_start + 26 then
      return l_2_3.name, string.char(l_2_0 - l_2_3.upper_start + string.byte("A"))
    elseif l_2_3.lower_start and l_2_0 >= l_2_3.lower_start and l_2_0 < l_2_3.lower_start + 26 then
      return l_2_3.name, string.char(l_2_0 - l_2_3.lower_start + string.byte("a"))
    end
  end
  for l_2_4, l_2_5 in ipairs(l_0_2) do
    if l_2_0 >= l_2_5.upper_start and l_2_0 < l_2_5.upper_start + 26 then
      return l_2_5.name, string.char(l_2_0 - l_2_5.upper_start + string.byte("A"))
    elseif l_2_0 >= l_2_5.lower_start and l_2_0 < l_2_5.lower_start + 26 then
      return l_2_5.name, string.char(l_2_0 - l_2_5.lower_start + string.byte("a"))
    end
  end
  return nil, nil
end

local l_0_5 = {}
local l_0_6 = 0
local l_0_7 = {}
local l_0_8 = {}
local l_0_9 = {}
local l_0_10 = 1
while l_0_10 <= #l_0_0 do
  local l_0_11 = l_0_0:byte(l_0_10)
  if (l_0_11 == 226 or l_0_11 == 239) and l_0_10 + 2 <= #l_0_0 then
    do
      local l_0_12, l_0_13 = l_0_0:byte(l_0_10 + 1, l_0_10 + 2)
      local l_0_14 = l_0_11 % 16 * 4096 + l_0_12 % 64 * 64 + l_0_13 % 64
      local l_0_15, l_0_16 = l_0_4(l_0_14)
      if l_0_15 and l_0_16 then
        if l_0_5[l_0_15] == nil then
          l_0_5[l_0_15] = 0
        end
        l_0_5[l_0_15] = l_0_5[l_0_15] + 1
        l_0_8[l_0_15] = true
        l_0_6 = l_0_6 + 1
        table.insert(l_0_7, l_0_16)
        table.insert(l_0_9, l_0_16)
      end
      l_0_10 = l_0_10 + 3
    end
  elseif l_0_11 == 240 and l_0_10 + 3 <= #l_0_0 then
    do
      local l_0_17, l_0_18, l_0_19 = l_0_0:byte(l_0_10 + 1, l_0_10 + 3)
      local l_0_20 = l_0_3(l_0_11, l_0_17, l_0_18, l_0_19)
      local l_0_21, l_0_22 = l_0_4(l_0_20)
      if l_0_21 and l_0_22 then
        if l_0_5[l_0_21] == nil then
          l_0_5[l_0_21] = 0
        end
        l_0_5[l_0_21] = l_0_5[l_0_21] + 1
        l_0_8[l_0_21] = true
        l_0_6 = l_0_6 + 1
        table.insert(l_0_7, l_0_22)
        table.insert(l_0_9, l_0_22)
      end
      l_0_10 = l_0_10 + 4
    end
  else
    local l_0_23 = l_0_0:sub(l_0_10, l_0_10)
    if l_0_23:match("[%w]") then
      table.insert(l_0_9, l_0_23)
    end
    l_0_10 = l_0_10 + 1
  end
end
if 1 <= l_0_6 then
  local l_0_24 = 0
  for l_0_25, l_0_26 in pairs(l_0_5) do
    if 0 < l_0_26 then
      l_0_24 = l_0_24 + 1
      mp.set_mpattribute("Lua:FnameUnicodeStyleCharCount!" .. l_0_25 .. "!" .. tostring(l_0_26))
      if 4 <= l_0_26 then
        mp.set_mpattribute("Lua:FnameUnicodeStyleChar!" .. l_0_25 .. "!GTE4")
      end
      if 8 <= l_0_26 then
        mp.set_mpattribute("Lua:FnameUnicodeStyleChar!" .. l_0_25 .. "!GTE8")
      end
      if 15 <= l_0_26 then
        mp.set_mpattribute("Lua:FnameUnicodeStyleChar!" .. l_0_25 .. "!GTE15")
      end
      if 20 <= l_0_26 then
        mp.set_mpattribute("Lua:FnameUnicodeStyleChar!" .. l_0_25 .. "!GTE20")
      end
    end
  end
  if 1 <= l_0_24 then
    mp.set_mpattribute("Lua:FnameNumberOfUnicodeStyles!" .. tostring(l_0_24))
  end
  if 4 <= l_0_6 then
    mp.set_mpattribute("Lua:FnameUnicodeStyleCharTotalCountGTE4")
  end
  if 8 <= l_0_6 then
    mp.set_mpattribute("Lua:FnameUnicodeStyleCharTotalCountGTE8")
  end
  if 15 <= l_0_6 then
    mp.set_mpattribute("Lua:FnameUnicodeStyleCharTotalCountGTE15")
  end
  if 20 <= l_0_6 then
    mp.set_mpattribute("Lua:FnameUnicodeStyleCharTotalCountGTE20")
  end
  local l_0_27 = table.concat(l_0_7)
  if l_0_27 ~= nil and 4 <= #l_0_27 then
    l_0_27 = string.lower(l_0_27)
    mp.set_mpattribute("Lua:FnameUniStylePlain!" .. l_0_27)
    if string.find(l_0_27, "code", 1, true) ~= nil then
      mp.set_mpattribute("Lua:FnameUniStylePlainHasString!code")
    end
    if string.find(l_0_27, "pass", 1, true) ~= nil then
      mp.set_mpattribute("Lua:FnameUniStylePlainHasString!pass")
    end
    if string.find(l_0_27, "password", 1, true) ~= nil then
      mp.set_mpattribute("Lua:FnameUniStylePlainHasString!password")
    end
    if string.find(l_0_27, "install", 1, true) ~= nil then
      mp.set_mpattribute("Lua:FnameUniStylePlainHasString!install")
    end
    if string.find(l_0_27, "setup", 1, true) ~= nil then
      mp.set_mpattribute("Lua:FnameUniStylePlainHasString!setup")
    end
    if string.find(l_0_27, "download", 1, true) ~= nil then
      mp.set_mpattribute("Lua:FnameUniStylePlainHasString!download")
    end
    if string.find(l_0_27, "update", 1, true) ~= nil then
      mp.set_mpattribute("Lua:FnameUniStylePlainHasString!update")
    end
  end
  local l_0_28 = table.concat(l_0_9)
  if l_0_28 ~= nil and 4 <= #l_0_28 then
    l_0_28 = string.lower(l_0_28)
    mp.set_mpattribute("Lua:FnameUniStyleMix!" .. l_0_28)
  end
  return mp.INFECTED
end
return mp.CLEAN
