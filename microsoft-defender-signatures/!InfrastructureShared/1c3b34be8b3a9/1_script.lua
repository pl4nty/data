-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1c3b34be8b3a9\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
    local l_0_0, l_0_3 = nil, nil
  end
  do
    if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
      local l_0_1, l_0_4 = , (string.lower)((this_sigattrlog[6]).utf8p2)
    end
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_1 and l_0_4 then
      do
        if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 and (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 and (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 and (this_sigattrlog[4]).matched then
          local l_0_2, l_0_5 = nil
        end
        -- DECOMPILER ERROR at PC80: Confused about usage of register: R2 in 'UnsetPending'

        if (this_sigattrlog[4]).utf8p2 then
          local l_0_6 = nil
          if isnull((string.match)((this_sigattrlog[4]).utf8p2, "Uri=([^;]+)")) then
            return mp.CLEAN
          end
          local l_0_7 = nil
          if (string.match)((string.match)((this_sigattrlog[4]).utf8p2, "Uri=([^;]+)"), "^https?://") then
            local l_0_8, l_0_9 = nil
            if (mp.CheckUrl)((string.match)((this_sigattrlog[4]).utf8p2, "Uri=([^;]+)")) == 1 and (string.match)((this_sigattrlog[4]).utf8p2, "Uri=([^;]+)") == 1 then
              return mp.CLEAN
            end
            local l_0_10 = {SIG_CONTEXT = "BM", CONTENT_SOURCE = "ALLOCVM_TAINT_REMOTETHREAD"}
            local l_0_11 = nil
            if ((SafeGetUrlReputation({l_0_9}, l_0_10, false, 3000)).urls)[l_0_9] and (((SafeGetUrlReputation({l_0_9}, l_0_10, false, 3000)).urls)[l_0_9]).determination == 2 and (((SafeGetUrlReputation({l_0_9}, l_0_10, false, 3000)).urls)[l_0_9]).confidence >= 60 then
              local l_0_12 = nil
              if not pcall(string.match, l_0_6, "regionsize:(%d+)") or isnull(R11_PC144) then
                return mp.CLEAN
              end
              ;
              (bm.add_related_string)(R11_PC144, R12_PC156, bm.RelatedStringBMReport)
              -- DECOMPILER ERROR at PC159: Overwrote pending register: R11 in 'AssignReg'

              ;
              (bm.add_related_string)(R11_PC144, R12_PC156, bm.RelatedStringBMReport)
              -- DECOMPILER ERROR at PC166: Overwrote pending register: R11 in 'AssignReg'

              -- DECOMPILER ERROR at PC167: Overwrote pending register: R12 in 'AssignReg'

              ;
              (bm.add_related_string)(R11_PC144, R12_PC156, bm.RelatedStringBMReport)
              return mp.INFECTED
            end
          end
        end
        do
          return mp.CLEAN
        end
      end
    end
  end
end

