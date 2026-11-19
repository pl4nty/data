-- Threat: !InfrastructureShared
-- Name: 32b3073fefe9
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1, l_0_2, l_0_3 = l_0_0:match("(%d+);(%w+);(%w+)")
  bm.add_related_string("detection_weight", l_0_1, bm.RelatedStringBMReport)
  bm.add_related_string("level", l_0_2, bm.RelatedStringBMReport)
  local l_0_4 = GetRollingQueue(l_0_3)
  bm.add_related_string(this_sigattrlog[1].utf8p1, safeJsonSerialize(l_0_4), bm.RelatedStringBMReport)
  local l_0_5 = false
  local l_0_6 = false
  local l_0_7 = false
  local l_0_8 = false
  for l_0_9, l_0_10 in ipairs(l_0_4) do
    local l_0_11 = safeJsonDeserialize(l_0_10.key)
    if not l_0_11.procInfo then
      return mp.CLEAN
    end
    local l_0_12 = l_0_11.procInfo
    if l_0_12.shellScripts then
      local l_0_13 = l_0_12.shellScripts
      for l_0_14, l_0_15 in ipairs(l_0_13) do
        local l_0_16 = mp.ContextualExpandEnvironmentVariables(l_0_15)
        if l_0_16 then
          bm.add_related_file(l_0_16)
          l_0_5 = true
        end
      end
    end
    if not l_0_12.friendly then
      l_0_8 = true
    end
    if l_0_12.hasScriptInCmdline then
      l_0_7 = true
    end
    if l_0_12.avExcludedEntities and next(l_0_12.avExcludedEntities) then
      l_0_6 = true
    end
    if l_0_11.parents then
      local l_0_17 = l_0_11.parents
      for l_0_18, l_0_19 in ipairs(l_0_17) do
        if not l_0_19.friendly then
          l_0_8 = true
        end
        if l_0_19.shellScripts then
          local l_0_20 = l_0_19.shellScripts
          for l_0_21, l_0_22 in ipairs(l_0_20) do
            local l_0_23 = mp.ContextualExpandEnvironmentVariables(l_0_22)
            if l_0_23 then
              bm.add_related_file(l_0_23)
              l_0_5 = true
            end
          end
        end
      end
    end
    local l_0_24 = tonumber(l_0_10.value)
    local l_0_25 = l_0_12.pid
    if (l_0_7 or l_0_5 or l_0_8) and 20 <= l_0_24 then
      MpCommon.BmTriggerSig(l_0_25, "MassTampering_HighScore_Event", l_0_10.key)
      return mp.CLEAN
    end
  end
  local l_0_26 = string.lower(bm.get_imagepath())
  if l_0_26 and string.find(l_0_26, "svchost", 1, true) and not l_0_5 and not l_0_6 and not l_0_7 then
    return mp.CLEAN
  end
end
reportSessionInformationInclusive()
reportRelevantUntrustedEntities(0)
return mp.INFECTED
