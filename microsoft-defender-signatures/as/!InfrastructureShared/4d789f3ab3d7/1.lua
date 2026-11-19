-- Threat: !InfrastructureShared
-- Name: 4d789f3ab3d7
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
if l_0_3 == nil or l_0_3.size ~= 66 then
  return mp.CLEAN
end
local l_0_4 = l_0_2.VA + l_0_3.offset
local l_0_5 = mp.ReadProcMem(l_0_4, l_0_3.size)
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = string.lower(tostring(l_0_5))
if #l_0_6 ~= 66 then
  return mp.CLEAN
end
if not l_0_6:match("^[a-f0-9]+$") then
  return mp.CLEAN
end
local l_0_7 = crypto.Sha256Buffer(l_0_6, 0, #l_0_6)
if l_0_7 == nil or #l_0_7 ~= 64 then
  return mp.CLEAN
end
l_0_7 = string.lower(l_0_7)
local l_0_8 = l_0_7:sub(-6)
local l_0_9 = "https://coreflowmain.invalid/bucket/mod24/v2/" .. l_0_8
local l_0_10 = {
  SIG_CONTEXT = "HSTR",
  CONTEXT_SOURCE = "CoreFlowMain",
  LOOKUP_PHASE = "MODULO_24_BUCKET_V2",
  BUCKET_HEX = l_0_8,
  TAG = "NOLOOKUP"
}
local l_0_11 = SafeGetUrlReputation({l_0_9}, l_0_10)
if l_0_11 == nil or l_0_11.error ~= nil then
  return mp.CLEAN
end
if l_0_11.urls[l_0_9].context.action ~= "go" then
  return mp.CLEAN
end
local l_0_12 = l_0_7:sub(0, 6)
local l_0_13 = l_0_11.urls[l_0_9].context.checks
l_0_13 = explode(l_0_13, ",")
local l_0_14 = false
for l_0_15, l_0_16 in ipairs(l_0_13) do
  if l_0_16 == l_0_12 then
    l_0_14 = true
    break
  end
end
if not l_0_14 then
  return mp.CLEAN
end
local l_0_17 = "https://coreflowmain.invalid/sha256/v5/" .. l_0_7
local l_0_18 = {
  SIG_CONTEXT = "HSTR",
  CONTEXT_SOURCE = "CoreFlowMain",
  LOOKUP_PHASE = "SHA256_V5",
  EXACT_SHA256 = l_0_7,
  TAG = "NOLOOKUP"
}
l_0_11 = SafeGetUrlReputation({l_0_17}, l_0_18)
return mp.CLEAN
