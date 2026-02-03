-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\155b35d9a4c8b\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1, l_0_2, l_0_5, l_0_9, l_0_14, l_0_16, l_0_20, l_0_23, l_0_26 = nil, nil, nil
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
    local l_0_3 = nil
    if not (this_sigattrlog[1]).utf8p2 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R3 in 'UnsetPending'

  end
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 then
    local l_0_4 = ((this_sigattrlog[3]).utf8p1):match("([^\\]+)$")
    local l_0_6 = ((string.lower)((this_sigattrlog[1]).utf8p2)):match("create(.*)binpath")
    if not (this_sigattrlog[3]).ppid then
      local l_0_7 = nil
    end
  end
  do
    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 then
      local l_0_8, l_0_12, l_0_13, l_0_15, l_0_17, l_0_18, l_0_19, l_0_22, l_0_25 = ((this_sigattrlog[4]).utf8p1):match("([^\\]+)$"), (MpCommon.GetImagePathFromPid)((this_sigattrlog[3]).image_path or "")
      l_0_15 = this_sigattrlog
      l_0_15 = l_0_15[4]
      l_0_15 = l_0_15.image_path
      l_0_13 = l_0_15 or ""
      if not l_0_13 then
        l_0_15 = this_sigattrlog
        l_0_15 = l_0_15[4]
        l_0_15 = l_0_15.ppid
        if not l_0_15 then
          l_0_15 = ""
          local l_0_11 = nil
        end
        do
          do
            l_0_17 = MpCommon
            l_0_17 = l_0_17.GetImagePathFromPid
            l_0_18 = l_0_15
            l_0_17 = l_0_17(l_0_18)
            l_0_13 = l_0_17
            -- DECOMPILER ERROR at PC95: freeLocal<0 in 'ReleaseLocals'

            -- DECOMPILER ERROR at PC95: Confused about usage of register: R0 in 'UnsetPending'

            -- DECOMPILER ERROR at PC97: Confused about usage of register: R1 in 'UnsetPending'

            if not l_0_8 or not l_0_12 then
              return mp.CLEAN
            end
            -- DECOMPILER ERROR at PC103: Confused about usage of register: R1 in 'UnsetPending'

            -- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

            -- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

            if contains(l_0_12, l_0_8) then
              (bm.add_related_string)("RegisteredSrv", l_0_8, bm.RelatedStringBMReport)
              local l_0_28 = nil
              local l_0_29 = nil
              -- DECOMPILER ERROR at PC118: Confused about usage of register: R2 in 'UnsetPending'

              do
                ;
                (bm.add_related_string)("ProcName_Reg", l_0_13 or "", bm.RelatedStringBMReport)
                if reportRelevantUntrustedEntities(0) and next(reportRelevantUntrustedEntities(0)) then
                  (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(reportRelevantUntrustedEntities(0)), bm.RelatedStringBMReport)
                end
                do return mp.INFECTED end
                -- DECOMPILER ERROR at PC146: freeLocal<0 in 'ReleaseLocals'

                return mp.CLEAN
              end
            end
          end
        end
      end
    end
  end
end

