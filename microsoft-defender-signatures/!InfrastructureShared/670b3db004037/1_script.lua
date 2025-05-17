-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\670b3db004037\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 then
  local l_0_0, l_0_1, l_0_3, l_0_4 = nil, nil
  l_0_1 = "(c:\\\\user.*(desktop|downloads|documents|pictures|music|videos)|c:\\\\programdata)([\\\\*%]+)?$"
  local l_0_2, l_0_5 = nil
end
do
  if not (this_sigattrlog[2]).matched or not (this_sigattrlog[2]).utf8p1 or (string.lower)((this_sigattrlog[2]).utf8p1) then
    local l_0_6 = nil
    if not (MpCommon.StringRegExpSearch)("hklm\\\\software(\\\\policies)?\\\\microsoft\\\\(windows defender|microsoft antimalware)\\\\exclusions\\\\paths\\\\\\\\", l_0_6) or not (MpCommon.StringRegExpSearch)("\\\\\\\\%.*%$", l_0_6) then
      return mp.CLEAN
    end
    local l_0_7 = nil
    if not (bm.get_current_process_startup_info)() or not ((bm.get_current_process_startup_info)()).ppid then
      return mp.CLEAN
    end
    do
      if not (bm.get_imagepath)() then
        local l_0_8, l_0_9, l_0_10, l_0_17 = , ((bm.get_current_process_startup_info)()).image_path
      end
      -- DECOMPILER ERROR at PC73: Confused about usage of register: R4 in 'UnsetPending'

      if not l_0_10 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC78: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC81: Confused about usage of register: R4 in 'UnsetPending'

      if l_0_10 and contains(l_0_10, "svchost.exe") then
        local l_0_11 = nil
        local l_0_12 = nil
        local l_0_13 = nil
        local l_0_14, l_0_15 = nil
        local l_0_16 = 86400
        if not "SigHitCount_Exclusions_Susp" then
          AppendToRollingQueue(l_0_14, l_0_15, 1, l_0_16, 100)
          add_parents()
          ;
          (bm.add_related_string)("AppliedThroughPolicy", safeJsonSerialize({count = "SigHitCount_Exclusions_Susp", key = l_0_15}), bm.RelatedStringBMReport)
          return mp.INFECTED
        else
          -- DECOMPILER ERROR at PC131: Confused about usage of register: R9 in 'UnsetPending'

          if "SigHitCount_Exclusions_Susp" then
            if tonumber(R12_PC124) < 5 then
              AppendToRollingQueue(R12_PC124, l_0_15, tonumber(R12_PC124) + 1, l_0_16, 100)
              add_parents()
              -- DECOMPILER ERROR at PC139: Overwrote pending register: R12 in 'AssignReg'

              -- DECOMPILER ERROR at PC141: Confused about usage of register: R10 in 'UnsetPending'

              ;
              (bm.add_related_string)(R12_PC124, safeJsonSerialize({count = "SigHitCount_Exclusions_Susp", key = l_0_15}), bm.RelatedStringBMReport)
              return mp.INFECTED
            else
              -- DECOMPILER ERROR at PC151: Overwrote pending register: R12 in 'AssignReg'

              -- DECOMPILER ERROR at PC153: Confused about usage of register: R9 in 'UnsetPending'

              AppendToRollingQueue(R12_PC124, l_0_15, tonumber(R12_PC124) + 1, l_0_16, 100)
              return mp.CLEAN
            end
          end
        end
      end
      do
        do
          add_parents()
          do return mp.INFECTED end
          do return mp.CLEAN end
          -- WARNING: undefined locals caused missing assignments!
        end
      end
    end
  end
end

