-- Threat: !InfrastructureShared
-- Name: !#SLF:AIMCP/SuspPromptEncoding.A
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: MpIsAiNetPromptScan

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if r0_0 ~= nil and r0_0 == mp.SCANREASON_NET_PROMPTSTREAM then
  local r0_1 = mp.getfilesize()
  r0_1 = r0_1 > 1536000 and 1536000 or r0_1
  mp.readprotection(false)
  local r0_2 = tostring(mp.readfile(0, r0_1))
  mp.readprotection(true)
  r0_2 = r0_2 or mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
  if r0_2 then
    local r0_3 = {
      "󠁴󠁨", "󠁔󠁈", "󠁔󠁨", "󠁴󠁈", "󠁨󠁥", "󠁈󠁅", "󠁈󠁥", "󠁨󠁅", "󠁩󠁮", "󠁉󠁎", "󠁉󠁮", "󠁩󠁎", "󠁥󠁲", "󠁅󠁒", "󠁅󠁲", "󠁥󠁒",
      "󠁡󠁮", "󠁁󠁎", "󠁁󠁮", "󠁡󠁎", "󠁲󠁥", "󠁒󠁅", "󠁒󠁥", "󠁲󠁅", "󠁡󠁴", "󠁁󠁔", "󠁁󠁴", "󠁡󠁔", "󠁯󠁮", "󠁏󠁎", "󠁏󠁮", "󠁯󠁎",
      "󠁮󠁤", "󠁎󠁄", "󠁎󠁤", "󠁮󠁄", "󠁥󠁮", "󠁅󠁎", "󠁅󠁮", "󠁥󠁎", "󠁥󠁳", "󠁅󠁓", "󠁅󠁳", "󠁥󠁓"
    }
    local r0_4 = 0
    local r0_5 = {}
    for r0_6, r0_7 in ipairs(r0_3) do
      local r0_8, r0_9 = string.find(r0_2, r0_7, 1, true)
      if r0_9 then
        r0_4 = r0_4 + 1
        local r0_10 = 512
        local r0_11 = r0_9 - 80
        r0_11 = r0_11 < 0 and 0 or r0_11
        local r0_12 = string.sub(r0_2, r0_11, r0_11 + r0_10)
        local r0_13 = MpCommon.Base64Encode(r0_12)
        table.insert(r0_5, r0_13)
      end
    end
    if r0_4 > 0 then
      local r0_14 = safeJsonSerialize({ MatchedSurroundings = r0_5 })
      mp.SetDetectionString(r0_14)
      set_research_data("MatchedSurroundings", r0_14, false)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
