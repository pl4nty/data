-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3073fefe9\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1, l_0_2, l_0_3 = l_0_0:match("(%d+);(%w+);(%w+)")
  ;
  (bm.add_related_string)("detection_weight", l_0_1, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("level", l_0_2, bm.RelatedStringBMReport)
  local l_0_4 = GetRollingQueue(l_0_3)
  ;
  (bm.add_related_string)((this_sigattrlog[1]).utf8p1, safeJsonSerialize(l_0_4), bm.RelatedStringBMReport)
  local l_0_5 = false
  local l_0_6 = false
  local l_0_7 = false
  local l_0_8 = false
  for l_0_12,l_0_13 in ipairs(l_0_4) do
    local l_0_14 = safeJsonDeserialize(l_0_13.key)
    if not l_0_14.procInfo then
      return mp.CLEAN
    end
    local l_0_15 = l_0_14.procInfo
    if l_0_15.shellScripts then
      local l_0_16 = l_0_15.shellScripts
      for l_0_20,l_0_21 in ipairs(l_0_16) do
        local l_0_22 = (mp.ContextualExpandEnvironmentVariables)(l_0_21)
        if l_0_22 then
          (bm.add_related_file)(l_0_22)
          l_0_5 = true
        end
      end
    end
    do
      l_0_16 = l_0_15.friendly
      if not l_0_16 then
        l_0_8 = true
      end
      l_0_16 = l_0_15.hasScriptInCmdline
      if l_0_16 then
        l_0_7 = true
      end
      l_0_16 = l_0_15.avExcludedEntities
      if l_0_16 then
        l_0_16 = next
        l_0_16 = l_0_16(l_0_15.avExcludedEntities)
        if l_0_16 then
          l_0_6 = true
        end
      end
      l_0_16 = l_0_14.parents
      if l_0_16 then
        l_0_16 = l_0_14.parents
        local l_0_23 = nil
        l_0_23 = ipairs
        l_0_23 = l_0_23(l_0_16)
        for l_0_27,l_0_28 in l_0_23 do
          local l_0_28 = nil
          l_0_28 = l_0_27.friendly
          if not l_0_28 then
            l_0_8 = true
          end
          l_0_28 = l_0_27.shellScripts
          if l_0_28 then
            l_0_28 = l_0_27.shellScripts
            local l_0_29 = nil
            l_0_29 = ipairs
            l_0_29 = l_0_29(l_0_28)
            for l_0_33,l_0_34 in l_0_29 do
              local l_0_34 = nil
              l_0_34 = mp
              l_0_34 = l_0_34.ContextualExpandEnvironmentVariables
              l_0_34 = l_0_34(l_0_33)
              local l_0_35 = nil
              if l_0_34 then
                l_0_35 = bm
                l_0_35 = l_0_35.add_related_file
                l_0_35(l_0_34)
                l_0_5 = true
              end
            end
          end
        end
      end
      do
        l_0_16 = tonumber
        l_0_16 = l_0_16(l_0_13.value)
        local l_0_36 = nil
        local l_0_37 = nil
        if (l_0_7 or l_0_5 or l_0_8) and l_0_16 >= 20 then
          do
            (MpCommon.BmTriggerSig)(l_0_36, l_0_37, l_0_13.key)
            do return mp.CLEAN end
            -- DECOMPILER ERROR at PC156: Confused about usage of register R18 for local variables in 'ReleaseLocals'

            -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC156: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
    end
  end
  local l_0_38 = nil
  if (string.lower)((bm.get_imagepath)()) and (string.find)((string.lower)((bm.get_imagepath)()), "svchost", 1, l_0_14) and not l_0_5 and not l_0_6 and not l_0_7 then
    do
      do return mp.CLEAN end
      -- DECOMPILER ERROR at PC184: Confused about usage of register R17 for local variables in 'ReleaseLocals'

      l_0_0 = reportSessionInformationInclusive
      l_0_0()
      l_0_0 = reportRelevantUntrustedEntities
      l_0_1 = 0
      l_0_0(l_0_1)
      l_0_0 = mp
      l_0_0 = l_0_0.INFECTED
      return l_0_0
    end
  end
end

