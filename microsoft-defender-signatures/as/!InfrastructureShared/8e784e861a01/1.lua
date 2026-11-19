-- Threat: !InfrastructureShared
-- Name: 8e784e861a01
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
local l_0_1 = mp.hstr_full_log()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1[1]
if l_0_2 == nil or l_0_2.VA == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2.match_offsets_ex and l_0_2.match_offsets_ex[1] or nil
if l_0_3 == nil or l_0_3.offset == nil or l_0_3.size ~= 152 then
  return mp.CLEAN
end
local l_0_4 = mp.ReadProcMem(l_0_2.VA + l_0_3.offset, l_0_3.size)
if l_0_4 == nil or #l_0_4 ~= 152 then
  return mp.CLEAN
end
local l_0_5 = {}
for l_0_6 = 1, #l_0_4, 2 do
  local l_0_7, l_0_8 = l_0_4:byte(l_0_6, l_0_6 + 1)
  if l_0_7 == nil or l_0_8 ~= 0 then
    return mp.CLEAN
  end
  l_0_5[#l_0_5 + 1] = string.char(l_0_7)
end
local l_0_9 = table.concat(l_0_5)
if #l_0_9 ~= 76 or not l_0_9:match("^%x+$") then
  return mp.CLEAN
end
local l_0_10 = string.lower(l_0_9:sub(1, 64))
local l_0_11 = crypto.Sha256Buffer(l_0_10, 0, #l_0_10)
if l_0_11 == nil or #l_0_11 ~= 64 then
  return mp.CLEAN
end
l_0_11 = string.lower(l_0_11)
if not l_0_11:match("^%x+$") then
  return mp.CLEAN
end
local l_0_12 = l_0_11:sub(-6)
local l_0_13 = l_0_11:sub(1, 6)
local l_0_14 = "https://abusecommmain.invalid"
local l_0_15 = l_0_14 .. "/bucket/mod24/v2/" .. l_0_12
local l_0_16 = {
  SIG_CONTEXT = "HSTR",
  CONTEXT_SOURCE = "AbuseCommMain",
  LOOKUP_PHASE = "MODULO_24_BUCKET_V2",
  BUCKET_HEX = l_0_12,
  TAG = "NOLOOKUP"
}
local l_0_17 = SafeGetUrlReputation({l_0_15}, l_0_16)
if l_0_17 == nil or l_0_17.error ~= nil or l_0_17.urls == nil then
  return mp.CLEAN
end
local l_0_18 = l_0_17.urls[l_0_15]
if l_0_18 == nil or l_0_18.context == nil then
  return mp.CLEAN
end
if l_0_18.context.action ~= "go" then
  return mp.CLEAN
end
local l_0_19 = l_0_18.context.checks
if l_0_19 == nil or type(l_0_19) ~= "string" then
  return mp.CLEAN
end
local l_0_20 = explode(l_0_19, ",")
if l_0_20 == nil then
  return mp.CLEAN
end
local l_0_21 = false
for l_0_22, l_0_23 in ipairs(l_0_20) do
  if string.lower(l_0_23):match("^%s*(.-)%s*$") == l_0_13 then
    l_0_21 = true
    break
  end
end
if not l_0_21 then
  return mp.CLEAN
end
local l_0_24 = l_0_14 .. "/sha256/v5/" .. l_0_11
local l_0_25 = {
  SIG_CONTEXT = "HSTR",
  CONTEXT_SOURCE = "AbuseCommMain",
  LOOKUP_PHASE = "SHA256_V5",
  EXACT_SHA256 = l_0_11,
  BUCKET_HEX = l_0_12,
  TAG = "NOLOOKUP"
}
l_0_17 = SafeGetUrlReputation({l_0_24}, l_0_25)
if l_0_17 == nil or l_0_17.error ~= nil then
  return mp.CLEAN
end
return mp.CLEAN
