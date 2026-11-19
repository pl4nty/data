-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:NPM/ObfuscatedNodeExfil.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if l_0_0 < 524288 or 8388608 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil then
  return mp.CLEAN
end
if string.sub(l_0_1, -3) ~= ".js" and string.sub(l_0_1, -4) ~= ".mjs" and string.sub(l_0_1, -4) ~= ".cjs" then
  return mp.CLEAN
end
local l_0_2 = tostring(headerpage)
local l_0_3 = string.find(l_0_2, "while(!![])", 1, true) and string.find(l_0_2, "['push'](", 1, true) and string.find(l_0_2, "['shift']()", 1, true)
local l_0_4 = string.find(l_0_2, "\\x61\\x62\\x63\\x64\\x65\\x66", 1, true) and string.find(l_0_2, "decodeURIComponent", 1, true)
if not l_0_3 and not l_0_4 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_5 = tostring(mp.readfile(0, l_0_0))
mp.readprotection(true)
if l_0_5 == nil or #l_0_5 ~= l_0_0 then
  return mp.CLEAN
end
if not (string.find(l_0_5, "\\x61\\x62\\x63\\x64\\x65\\x66", 1, true) and string.find(l_0_5, "decodeURIComponent", 1, true)) or not string.find(l_0_5, "execSync,spawn", 1, true) and not string.find(l_0_5, "spawn,execSync", 1, true) then
  return mp.CLEAN
end
local l_0_6 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/"
local l_0_7 = {}
for l_0_8 = 1, #l_0_6 do
  l_0_7[string.sub(l_0_6, l_0_8, l_0_8)] = l_0_8 - 1
end

local function l_0_9(l_1_0)
  local l_1_1 = {}
  for l_1_2 = 1, #l_1_0, 4 do
    local l_1_3 = l_0_7[string.sub(l_1_0, l_1_2, l_1_2)]
    local l_1_4 = l_0_7[string.sub(l_1_0, l_1_2 + 1, l_1_2 + 1)]
    local l_1_5 = l_0_7[string.sub(l_1_0, l_1_2 + 2, l_1_2 + 2)]
    local l_1_6 = l_0_7[string.sub(l_1_0, l_1_2 + 3, l_1_2 + 3)]
    if l_1_3 == nil or l_1_4 == nil then
      return nil
    end
    l_1_1[#l_1_1 + 1] = string.char(l_1_3 * 4 + (l_1_4 - l_1_4 % 16) / 16)
    if l_1_5 ~= nil then
      l_1_1[#l_1_1 + 1] = string.char(l_1_4 % 16 * 16 + (l_1_5 - l_1_5 % 4) / 4)
      if l_1_6 ~= nil then
        l_1_1[#l_1_1 + 1] = string.char(l_1_5 % 4 * 64 + l_1_6)
      end
    end
  end
  return table.concat(l_1_1)
end

local l_0_10 = {
  {
    encoded = "yxHPB3m",
    escaped = "\\x79\\x78\\x48\\x50\\x42\\x33\\x6d",
    decoded = "axios"
  },
  {
    encoded = "C3bHD24",
    escaped = "\\x43\\x33\\x62\\x48\\x44\\x32\\x34",
    decoded = "spawn"
  },
  {
    encoded = "l3vWBg8",
    escaped = "\\x6c\\x33\\x76\\x57\\x42\\x67\\x38",
    decoded = "/uplo"
  }
}
local l_0_11 = 0
for l_0_12, l_0_13 in ipairs(l_0_10) do
  local l_0_14 = l_0_13.encoded
  local l_0_15 = l_0_13.escaped
  local l_0_16 = string.find(l_0_5, "'" .. l_0_14 .. "'", 1, true) or string.find(l_0_5, "\"" .. l_0_14 .. "\"", 1, true) or string.find(l_0_5, "'" .. l_0_15 .. "'", 1, true) or string.find(l_0_5, "\"" .. l_0_15 .. "\"", 1, true)
  if l_0_16 and l_0_9(l_0_14) == l_0_13.decoded then
    l_0_11 = l_0_11 + 1
  end
end
if l_0_11 ~= #l_0_10 then
  return mp.CLEAN
end
return mp.INFECTED
