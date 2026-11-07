-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8e784e861a01\1.luac 

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
  local l_0_3, l_0_4, l_0_5, l_0_6, l_0_7 = l_0_2.match_offsets_ex and (l_0_2.match_offsets_ex)[1] or nil
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC37: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC40: Confused about usage of register: R3 in 'UnsetPending'

  if l_0_3 == nil or l_0_3.offset == nil or l_0_3.size ~= 152 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC51: Confused about usage of register: R3 in 'UnsetPending'

  local l_0_8 = nil
  if (mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_3.size) == nil or #(mp.ReadProcMem)(l_0_2.VA + l_0_3.offset, l_0_3.size) ~= 152 then
    return mp.CLEAN
  end
  local l_0_9 = nil
  for l_0_13 = 1, #l_0_9, 2 do
    local l_0_10 = {}
    -- DECOMPILER ERROR at PC67: Confused about usage of register: R9 in 'UnsetPending'

    local l_0_15 = l_0_9:byte(R9_PC67, R9_PC67 + 1)
    if l_0_15 == nil or l_0_9 ~= 0 then
      return mp.CLEAN
    end
    local l_0_16 = nil
    l_0_10[#l_0_10 + 1] = (string.char)(l_0_15)
  end
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R5 in 'UnsetPending'

  local l_0_17 = nil
  if #(table.concat)(l_0_10) ~= 76 or not ((table.concat)(l_0_10)):match("^%x+$") then
    return mp.CLEAN
  end
  local l_0_18 = nil
  local l_0_19 = nil
  if (crypto.Sha256Buffer)((string.lower)(((table.concat)(l_0_10)):sub(1, 64)), 0, #(string.lower)(((table.concat)(l_0_10)):sub(1, 64))) == nil or #(crypto.Sha256Buffer)((string.lower)(((table.concat)(l_0_10)):sub(1, 64)), 0, #(string.lower)(((table.concat)(l_0_10)):sub(1, 64))) ~= 64 then
    return mp.CLEAN
  end
  if not ((string.lower)((crypto.Sha256Buffer)((string.lower)(((table.concat)(l_0_10)):sub(1, 64)), 0, #(string.lower)(((table.concat)(l_0_10)):sub(1, 64))))):match("^%x+$") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC134: Confused about usage of register: R8 in 'UnsetPending'

  local l_0_20 = nil
  local l_0_21 = ((string.lower)((crypto.Sha256Buffer)((string.lower)(((table.concat)(l_0_10)):sub(1, 64)), 0, #(string.lower)(((table.concat)(l_0_10)):sub(1, 64))))):sub(-6)
  local l_0_22 = l_0_20:sub(1, 6)
  local l_0_23 = nil
  local l_0_24 = "https://abusecommmain.invalid" .. "/bucket/mod24/v2/" .. l_0_21
  local l_0_25 = {SIG_CONTEXT = "HSTR", CONTEXT_SOURCE = "AbuseCommMain", LOOKUP_PHASE = "MODULO_24_BUCKET_V2", BUCKET_HEX = l_0_21, TAG = "NOLOOKUP"}
  local l_0_26 = SafeGetUrlReputation
  l_0_26 = l_0_26({l_0_24}, l_0_25)
  if l_0_26 == nil or l_0_26.error ~= nil or l_0_26.urls == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC173: Confused about usage of register: R15 in 'UnsetPending'

  if (l_0_26.urls)[l_0_24] == nil or ((l_0_26.urls)[l_0_24]).context == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC179: Confused about usage of register: R15 in 'UnsetPending'

  if (((l_0_26.urls)[l_0_24]).context).action ~= "go" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC186: Confused about usage of register: R15 in 'UnsetPending'

  local l_0_27 = nil
  -- DECOMPILER ERROR at PC191: Confused about usage of register: R16 in 'UnsetPending'

  if (((l_0_26.urls)[l_0_24]).context).checks == nil or type((((l_0_26.urls)[l_0_24]).context).checks) ~= "string" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC199: Confused about usage of register: R16 in 'UnsetPending'

  local l_0_28 = nil
  if explode((((l_0_26.urls)[l_0_24]).context).checks, ",") == nil then
    return mp.CLEAN
  end
  local l_0_29 = nil
  for l_0_33,l_0_34 in ipairs(l_0_29) do
    local l_0_30 = false
    -- DECOMPILER ERROR at PC214: Confused about usage of register: R23 in 'UnsetPending'

    if ((string.lower)(R23_PC214)):match("^%s*(.-)%s*$") == l_0_22 then
      l_0_30 = true
      break
    end
  end
  do
    -- DECOMPILER ERROR at PC225: Confused about usage of register: R18 in 'UnsetPending'

    if not l_0_30 then
      return mp.CLEAN
    end
    local l_0_35 = nil
    local l_0_36 = l_0_23 .. "/sha256/v5/" .. l_0_20
    local l_0_37 = {SIG_CONTEXT = "HSTR", CONTEXT_SOURCE = "AbuseCommMain", LOOKUP_PHASE = "SHA256_V5", EXACT_SHA256 = l_0_20, BUCKET_HEX = l_0_21, TAG = "NOLOOKUP"}
    local l_0_38 = SafeGetUrlReputation
    l_0_38 = l_0_38({l_0_36}, l_0_37)
    l_0_26 = l_0_38
    if l_0_26 ~= nil then
      l_0_38 = l_0_26.error
    end
    if l_0_38 ~= nil then
      l_0_38 = mp
      l_0_38 = l_0_38.CLEAN
      return l_0_38
    end
    l_0_38 = mp
    l_0_38 = l_0_38.CLEAN
    return l_0_38
  end
end

