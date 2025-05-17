-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e3b355917e21\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 then
  local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
  local l_0_1 = "\\\\(\\w{1,2}:(\\\\*)?\\*?%?$)"
  local l_0_2, l_0_3 = (MpCommon.StringRegExpSearch)(l_0_1, l_0_0)
  if l_0_2 then
    local l_0_4 = (bm.get_current_process_startup_info)()
    if not l_0_4 or not l_0_4.ppid then
      return mp.CLEAN
    end
    do
      if not (bm.get_imagepath)() then
        local l_0_5, l_0_6, l_0_7, l_0_14 = l_0_4.image_path
      end
      -- DECOMPILER ERROR at PC41: Confused about usage of register: R5 in 'UnsetPending'

      if not l_0_5 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC46: Confused about usage of register: R5 in 'UnsetPending'

      -- DECOMPILER ERROR at PC49: Confused about usage of register: R5 in 'UnsetPending'

      if l_0_5 and contains(l_0_5, "svchost.exe") then
        local l_0_8 = nil
        local l_0_9 = "SigHitCount_Exclusions_FullDrive"
        local l_0_10 = l_0_0
        local l_0_11, l_0_12 = 86400, IsKeyInRollingQueue(l_0_9, l_0_10)
        local l_0_13 = nil
        if not l_0_13 then
          AppendToRollingQueue(l_0_9, l_0_10, 1, l_0_11, 100)
          add_parents()
          ;
          (bm.add_related_string)("AppliedThroughPolicy", safeJsonSerialize({count = l_0_13, key = l_0_10}), bm.RelatedStringBMReport)
          return mp.INFECTED
        else
          if l_0_13 then
            l_0_13 = tonumber(l_0_13)
            if l_0_13 < 5 then
              AppendToRollingQueue(l_0_9, l_0_10, l_0_13 + 1, l_0_11, 100)
              add_parents()
              -- DECOMPILER ERROR at PC109: Confused about usage of register: R11 in 'UnsetPending'

              ;
              (bm.add_related_string)("AppliedThroughPolicy", safeJsonSerialize({count = l_0_13, key = l_0_10}), bm.RelatedStringBMReport)
              return mp.INFECTED
            else
              AppendToRollingQueue(l_0_9, l_0_10, l_0_13 + 1, l_0_11, 100)
              return mp.CLEAN
            end
          end
        end
      else
        do
          do
            add_parents()
            do return mp.INFECTED end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

