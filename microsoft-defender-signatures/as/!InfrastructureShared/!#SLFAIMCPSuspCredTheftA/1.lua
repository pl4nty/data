-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFAIMCPSuspCredTheftA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
do
  if (mp.getfilesize)() > 1536000 then
    local l_0_1, l_0_2, l_0_3 = 1536000
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_4 = nil
  ;
  (mp.readprotection)(true)
  if tostring((mp.readfile)(0, l_0_1)) or not (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_5 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE))
  local l_0_6 = {"ignore all previous instructions", ".env file", " post "}
  local l_0_7 = 0
  for l_0_11,l_0_12 in ipairs(l_0_6) do
    local l_0_8 = 0
    -- DECOMPILER ERROR at PC67: Confused about usage of register: R10 in 'UnsetPending'

    local l_0_14 = (string.find)(l_0_5, R10_PC67, 1, true)
    if not l_0_5 then
      return mp.CLEAN
    end
    if l_0_7 == 0 or l_0_5 < l_0_7 then
      l_0_7 = 
    end
    if l_0_8 < l_0_5 then
      l_0_8 = 
    end
  end
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R5 in 'UnsetPending'

  if l_0_8 - l_0_7 > 1024 then
    return mp.CLEAN
  end
  do
    if l_0_7 - 80 < 1 then
      local l_0_15, l_0_16, l_0_18 = , 1
    end
    -- DECOMPILER ERROR at PC96: Confused about usage of register: R5 in 'UnsetPending'

    do
      if #l_0_5 < l_0_15 + 80 then
        local l_0_17, l_0_19 = nil
      end
      -- DECOMPILER ERROR at PC106: Confused about usage of register: R6 in 'UnsetPending'

      local l_0_20 = nil
      local l_0_21 = nil
      local l_0_22 = nil
      ;
      (mp.SetDetectionString)(safeJsonSerialize({MatchedSurroundings = (MpCommon.Base64Encode)((string.sub)(l_0_5, l_0_19, #l_0_5))}))
      set_research_data("MatchedSurroundings", safeJsonSerialize({MatchedSurroundings = (MpCommon.Base64Encode)((string.sub)(l_0_5, l_0_19, #l_0_5))}), false)
      return mp.INFECTED
    end
  end
end

