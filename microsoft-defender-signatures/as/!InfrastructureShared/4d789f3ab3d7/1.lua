-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4d789f3ab3d7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetHSTRCallerId)()
if l_0_0 ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
local l_0_1 = (mp.hstr_full_log)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1[1]
if l_0_2 == nil or l_0_2.VA == nil then
  return mp.CLEAN
end
do
  local l_0_3, l_0_4, l_0_5 = l_0_2.match_offsets_ex and (l_0_2.match_offsets_ex)[1] or nil
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC37: Confused about usage of register: R3 in 'UnsetPending'

  if l_0_3 == nil or l_0_3.size ~= 66 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R3 in 'UnsetPending'

  local l_0_6 = nil
  local l_0_7 = nil
  if (mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_6.size) == nil then
    return mp.CLEAN
  end
  local l_0_8 = nil
  if #(string.lower)(tostring((mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_6.size))) ~= 66 then
    return mp.CLEAN
  end
  if not ((string.lower)(tostring((mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_6.size)))):match("^[a-f0-9]+$") then
    return mp.CLEAN
  end
  local l_0_9 = nil
  if (crypto.Sha256Buffer)((string.lower)(tostring((mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_6.size))), 0, #(string.lower)(tostring((mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_6.size)))) == nil or #(crypto.Sha256Buffer)((string.lower)(tostring((mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_6.size))), 0, #(string.lower)(tostring((mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_6.size)))) ~= 64 then
    return mp.CLEAN
  end
  local l_0_10 = nil
  local l_0_11 = nil
  local l_0_12 = "https://coreflowmain.invalid/bucket/mod24/v2/" .. ((string.lower)((crypto.Sha256Buffer)((string.lower)(tostring((mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_6.size))), 0, #(string.lower)(tostring((mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_6.size)))))):sub(-6)
  local l_0_13 = {SIG_CONTEXT = "HSTR", CONTEXT_SOURCE = "CoreFlowMain", LOOKUP_PHASE = "MODULO_24_BUCKET_V2", BUCKET_HEX = l_0_11, TAG = "NOLOOKUP"}
  local l_0_14 = SafeGetUrlReputation
  l_0_14 = l_0_14({l_0_12}, l_0_13)
  if l_0_14 == nil or l_0_14.error ~= nil then
    return mp.CLEAN
  end
  if (((l_0_14.urls)[l_0_12]).context).action ~= "go" then
    return mp.CLEAN
  end
  local l_0_15 = l_0_10:sub(0, 6)
  local l_0_16 = explode((((l_0_14.urls)[l_0_12]).context).checks, ",")
  for l_0_20,l_0_21 in ipairs(l_0_16) do
    local l_0_17 = false
    -- DECOMPILER ERROR at PC148: Confused about usage of register: R19 in 'UnsetPending'

    if R19_PC148 == l_0_15 then
      l_0_17 = true
      break
    end
  end
  do
    -- DECOMPILER ERROR at PC154: Confused about usage of register: R14 in 'UnsetPending'

    if not l_0_17 then
      return mp.CLEAN
    end
    local l_0_22 = nil
    local l_0_23 = "https://coreflowmain.invalid/sha256/v5/" .. l_0_10
    local l_0_24 = {SIG_CONTEXT = "HSTR", CONTEXT_SOURCE = "CoreFlowMain", LOOKUP_PHASE = "SHA256_V5", EXACT_SHA256 = l_0_10, TAG = "NOLOOKUP"}
    local l_0_25 = SafeGetUrlReputation
    l_0_25 = l_0_25({l_0_23}, l_0_24)
    l_0_14 = l_0_25
    l_0_25 = mp
    l_0_25 = l_0_25.CLEAN
    return l_0_25
  end
end

