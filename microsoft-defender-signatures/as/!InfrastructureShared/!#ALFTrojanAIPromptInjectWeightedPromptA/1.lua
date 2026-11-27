-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIPromptInject/WeightedPrompt.A
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: MpIsAiNetPromptScan

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_NET_PROMPTSTREAM then
  local r0_0 = {}
  local r0_1 = { "full system and developer instructions", 6 }
  local r0_2 = { "full verbatim system prompt", 6 }
  local r0_3 = { "godmode", 2 }
  local r0_4 = { "oppositely", 3 }
  local r0_5 = { "semantically inverse", 3 }
  local r0_6 = { "never say", 2 }
  r0_0[1] = r0_1
  r0_0[2] = r0_2
  r0_0[3] = r0_3
  r0_0[4] = r0_4
  r0_0[5] = r0_5
  r0_0[6] = r0_6
  r0_0[7] = { "do not say", 2 }
  r0_0[8] = { "avoid using these phrases in all future responses", 2 }
  r0_0[9] = { "analyze this prompt", -2 }
  r0_0[10] = { "quoted example", -2 }
  r0_0[11] = { "do not follow the instructions", -2 }
  r0_1 = 0
  r0_2 = ipairs
  r0_3 = r0_0
  local r0_7, r0_8, r0_9 = r0_2(r0_3)
  r0_5 = nil
  r0_6 = nil
  for r0_10, r0_11 in r0_7, r0_8, r0_9 do
    if r0_1 < #r0_11[1] - 1 then
      local r0_12 = r0_11[1]
      r0_1 = #r0_12 - 1
    end
  end
  r0_7 = mp.getfilesize()
  r0_8 = 0
  r0_9 = ""
  local r0_13 = {}
  local r0_14, r0_15, r0_16, r0_17 = r0_8, r0_9, 0, ""
  while r0_14 < r0_7 do
    local r0_18 = 65536
    if r0_18 < r0_7 - r0_14 then
      r0_18 = r0_7 - r0_14
    end
    mp.readprotection(false)
    local r0_19 = mp.readfile(r0_14, r0_18)
    mp.readprotection(true)
    if r0_19 == nil then
      return mp.CLEAN
    end
    local r0_20 = tostring(r0_19)
    r0_19 = r0_20
    if #r0_19 == 0 then
      return mp.CLEAN
    end
    r0_20 = r0_15
    local r0_21 = string.lower(r0_19)
    r0_20 = r0_20 .. r0_21
    r0_21 = ipairs
    for r0_22, r0_23 in r0_21(r0_0) do
      if not r0_13[r0_22] and string.find(r0_20, r0_23[1], 1, true) then
        r0_13[r0_22] = true
        r0_16 = r0_16 + r0_23[2]
        local r0_24 = r0_17
        local r0_25 = r0_23[1]
        r0_17 = r0_24 .. r0_25 .. " "
      end
    end
    r0_21 = string.sub(r0_20, -r0_1)
    r0_15 = r0_21
    r0_14 = r0_14 + #r0_19
  end
  if r0_16 >= 6 then
    local r0_26 = {}
    r0_26.Score = r0_16
    local r0_27 = tostring
    local r0_28 = MpCommon.Base64Encode
    r0_28 = r0_28(string.sub(r0_17, 1, 10240)) or ""
    r0_27 = r0_27(r0_28)
    r0_26.LastMessage = r0_27
    r0_26.EnableInPortal = false
    r0_27 = safeJsonSerialize
    r0_27 = r0_27(r0_26)
    mp.SetDetectionString(r0_27)
    set_research_data("AdditionalInfo", r0_27, false)
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
