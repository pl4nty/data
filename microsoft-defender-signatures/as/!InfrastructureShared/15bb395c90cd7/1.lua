-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15bb395c90cd7\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil or #l_0_0 <= 8 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = (mp.ContextualExpandEnvironmentVariables)(l_0_0)
  if l_0_2 then
    l_0_2 = normalize_path((string.lower)(l_0_2))
  end
  if l_0_2 == nil or #l_0_2 <= 8 then
    return mp.CLEAN
  end
  local l_0_3 = function(l_1_0)
  -- function num : 0_0
  if l_1_0:sub(1, 1) == "\"" and l_1_0:sub(-1) == "\"" then
    local l_1_1, l_1_2 = l_1_0:sub, l_1_0
    local l_1_3 = 2
    do
      local l_1_4 = -2
      do return l_1_1(l_1_2, l_1_3, l_1_4) end
      -- DECOMPILER ERROR at PC16: Confused about usage of register R2 for local variables in 'ReleaseLocals'

      do return l_1_0 end
      -- DECOMPILER ERROR at PC17: Confused about usage of register R1 for local variables in 'ReleaseLocals'

    end
  end
end

  l_0_2 = l_0_3(l_0_2)
  if GetRollingQueueCountForKey(l_0_2, "software_deployment_tools_dropped_file") <= 0 then
    return mp.CLEAN
  end
  local l_0_4 = ""
  if GetRollingQueueCountForKey(l_0_2, "BM:MsIntuneDeployment.A") >= 1 then
    l_0_4 = "BM:MsIntuneDeployment.A,"
  end
  if GetRollingQueueCountForKey(l_0_2, "BM:MsIntuneDeployment.B") >= 1 then
    l_0_4 = l_0_4 .. "BM:MsIntuneDeployment.B"
  end
  if l_0_4 == "" then
    return mp.CLEAN
  end
  local l_0_5 = -1
  local l_0_6 = -1
  local l_0_7 = (MpCommon.GetPersistContext)(l_0_2)
  if l_0_7 ~= nil then
    for l_0_11,l_0_12 in ipairs(l_0_7) do
      local l_0_13 = tonumber((string.match)(l_0_12, "^Age:([0-9]+)$"))
      if l_0_13 ~= nil and l_0_5 < l_0_13 then
        l_0_5 = l_0_13
      end
      local l_0_14 = tonumber((string.match)(l_0_12, "^Prevalence:([0-9]+)$"))
      if l_0_14 ~= nil and l_0_6 < l_0_14 then
        l_0_6 = l_0_14
      end
    end
  end
  do
    ;
    (bm.add_related_file)(l_0_2)
    local l_0_15 = (string.format)("TriggerBMSig=%s,FileAge=%s,FilePrev=%s", l_0_4, tostring(l_0_5), tostring(l_0_6))
    ;
    (bm.add_related_string)("BmReferences", l_0_15, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end

