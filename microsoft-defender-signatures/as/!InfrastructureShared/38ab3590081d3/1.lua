-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\38ab3590081d3\1.luac 

-- params : ...
-- function num : 0
if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_3 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_4 = sigattr_tail[l_0_3]
  if l_0_4.matched and l_0_4.attribute == 16393 and l_0_4.utf8p1 then
    local l_0_5 = (string.lower)(l_0_4.utf8p1)
    local l_0_6 = false
    local l_0_7 = "hklm\\\\software(\\\\policies)?\\\\microsoft\\\\(windows defender|microsoft antimalware)\\\\exclusions\\\\processes\\\\\\\\"
    l_0_6 = (MpCommon.StringRegExpSearch)(l_0_7, l_0_5)
    if l_0_6 then
      local l_0_8 = (bm.get_current_process_startup_info)()
      if not l_0_8 or not l_0_8.ppid then
        return mp.CLEAN
      end
      do
        if not (bm.get_imagepath)() then
          local l_0_9, l_0_10, l_0_11, l_0_17 = l_0_8.image_path
        end
        -- DECOMPILER ERROR at PC55: Confused about usage of register: R9 in 'UnsetPending'

        if not l_0_9 then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC60: Confused about usage of register: R9 in 'UnsetPending'

        -- DECOMPILER ERROR at PC63: Confused about usage of register: R9 in 'UnsetPending'

        if l_0_9 and contains(l_0_9, "svchost.exe") then
          local l_0_12 = nil
          -- DECOMPILER ERROR at PC80: Confused about usage of register: R10 in 'UnsetPending'

          -- DECOMPILER ERROR at PC85: Confused about usage of register: R10 in 'UnsetPending'

          -- DECOMPILER ERROR at PC87: Confused about usage of register: R10 in 'UnsetPending'

          if (versioning.GetOrgID)() and ((crypto.Sha1Buffer)(((versioning.GetOrgID)()):lower(), 0, #((versioning.GetOrgID)()):lower()) == "f9a615dbb6affe49419dfe781bff51340f37e8fa" or (crypto.Sha1Buffer)(((versioning.GetOrgID)()):lower(), 0, #((versioning.GetOrgID)()):lower()) == "ebcfa46ce0defff07d341c8cca024ee1e826a9fa" or (crypto.Sha1Buffer)(((versioning.GetOrgID)()):lower(), 0, #((versioning.GetOrgID)()):lower()) == "5199817d05cd84cdcda32b87524adcafaf4c60bf") then
            return mp.CLEAN
          end
          local l_0_13 = nil
          local l_0_14 = l_0_5
          local l_0_15 = 86400
          local l_0_16 = (MpCommon.AtomicCounterValue)(l_0_14)
          if not l_0_16 then
            (MpCommon.AtomicCounterSet)(l_0_14, 1, l_0_15)
            add_parents()
            ;
            (bm.add_related_string)("AppliedThroughPolicy", safeJsonSerialize({count = l_0_16, key = l_0_14, count = 0}), bm.RelatedStringBMReport)
            return mp.INFECTED
          else
            if l_0_16 and l_0_16 < 5 then
              (MpCommon.AtomicCounterAdd)(l_0_14, 1)
              add_parents()
              -- DECOMPILER ERROR at PC140: Confused about usage of register: R14 in 'UnsetPending'

              ;
              (bm.add_related_string)("AppliedThroughPolicy", safeJsonSerialize({count = l_0_16, key = l_0_14, count = 0}), bm.RelatedStringBMReport)
              return mp.INFECTED
            else
              ;
              (MpCommon.AtomicCounterAdd)(l_0_14, 1)
              return mp.CLEAN
            end
          end
        else
          do
            do
              add_parents()
              do return mp.INFECTED end
              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end
return mp.CLEAN

