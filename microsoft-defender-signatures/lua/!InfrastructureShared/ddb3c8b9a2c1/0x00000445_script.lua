-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ddb3c8b9a2c1\0x00000445_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC13: Overwrote pending register: R1 in 'AssignReg'

if (this_sigattrlog[2]).matched then
  local l_0_1 = nil
  local l_0_0 = nil
else
  do
    -- DECOMPILER ERROR at PC30: Overwrote pending register: R0 in 'AssignReg'

    if (this_sigattrlog[3]).matched then
      local l_0_2, l_0_3 = l_0_1, (this_sigattrlog[3]).utf8p2
    else
      do
        if (this_sigattrlog[4]).matched then
          local l_0_4, l_0_7 = , (this_sigattrlog[4]).utf8p2
          l_0_4 = (string.lower)((this_sigattrlog[4]).utf8p1)
        else
          do
            do
              if (this_sigattrlog[5]).matched then
                local l_0_5, l_0_6 = (string.lower)((this_sigattrlog[5]).utf8p1), (this_sigattrlog[5]).utf8p2
              end
              -- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

              if isnull(l_0_5) or not (this_sigattrlog[1]).matched or not (this_sigattrlog[6]).matched then
                return mp.CLEAN
              end
              local l_0_8 = nil
              if isnull((bm.get_current_process_startup_info)()) or isnull(((bm.get_current_process_startup_info)()).ppid) then
                return mp.CLEAN
              end
              local l_0_9 = nil
              local l_0_10 = nil
              if (string.gsub)((string.lower)((this_sigattrlog[1]).utf8p1), "..*\\", "") ~= l_0_8 or (string.gsub)((string.lower)((this_sigattrlog[1]).utf8p1), "..*\\", "") ~= (string.lower)((this_sigattrlog[6]).utf8p1) then
                return mp.CLEAN
              end
              local l_0_11, l_0_12 = nil
              if isnull((string.match)((this_sigattrlog[6]).utf8p2, "TargetPPID:(%d+):(%d+);")) or isnull(R8_PC135) then
                return mp.CLEAN
              end
              local l_0_13 = nil
              -- DECOMPILER ERROR at PC147: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC150: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC151: Overwrote pending register: R8 in 'AssignReg'

              if R8_PC135 == (string.format)(R8_PC135, (string.match)((this_sigattrlog[6]).utf8p2, "TargetPPID:(%d+):(%d+);"), R10_PC146) then
                return R8_PC135
              end
              -- DECOMPILER ERROR at PC153: Overwrote pending register: R8 in 'AssignReg'

              local l_0_14 = nil
              local l_0_15 = nil
              -- DECOMPILER ERROR at PC158: Overwrote pending register: R10 in 'AssignReg'

              R10_PC146 = R10_PC146((bm.get_process_relationships)(R10_PC146))
              if not R10_PC146 then
                R10_PC146 = #(bm.get_process_relationships)(R10_PC146)
              end
              if R10_PC146 == 0 then
                R10_PC146 = true
                -- DECOMPILER ERROR at PC169: Overwrote pending register: R8 in 'AssignReg'

              end
              R10_PC146 = R10_PC146({})
              for l_0_19,l_0_20 in R10_PC146 do
                local l_0_16, l_0_17 = R8_PC135
                -- DECOMPILER ERROR at PC174: Confused about usage of register: R14 in 'UnsetPending'

                -- DECOMPILER ERROR at PC178: Overwrote pending register: R8 in 'AssignReg'

              end
              if R14_PC174.ppid ~= l_0_10.ppid or not l_0_16 then
                return mp.CLEAN
              end
              local l_0_21 = nil
              if mp.SIGATTR_LOG_SZ == 0 then
                return mp.CLEAN
              end
              for l_0_25 = mp.SIGATTR_LOG_SZ, 1, -1 do
                local l_0_22, l_0_23 = , {}
                -- DECOMPILER ERROR at PC200: Confused about usage of register: R14 in 'UnsetPending'

                -- DECOMPILER ERROR at PC206: Confused about usage of register: R15 in 'UnsetPending'

                -- DECOMPILER ERROR at PC210: Confused about usage of register: R15 in 'UnsetPending'

                -- DECOMPILER ERROR at PC215: Confused about usage of register: R15 in 'UnsetPending'

                -- DECOMPILER ERROR at PC221: Confused about usage of register: R15 in 'UnsetPending'

                -- DECOMPILER ERROR at PC231: Confused about usage of register: R15 in 'UnsetPending'

                -- DECOMPILER ERROR at PC238: Confused about usage of register: R15 in 'UnsetPending'

                if not isnull((sigattr_tail[R14_PC174]).attribute) and (sigattr_tail[R14_PC174]).attribute == 16522 and not isnull((sigattr_tail[R14_PC174]).utf8p1) and not isnull((sigattr_tail[R14_PC174]).utf8p2) and (string.find)((sigattr_tail[R14_PC174]).utf8p1, l_0_13 .. ":" .. l_0_14) and (string.find)((sigattr_tail[R14_PC174]).utf8p2, l_0_9) then
                  local l_0_28 = nil
                  -- DECOMPILER ERROR at PC257: Overwrote pending register: R19 in 'AssignReg'

                  if not isnull((string.match)((sigattr_tail[R14_PC174]).utf8p2, "vmbaseaddress:(%d+);vm[a-z]+:(%d+)")) and not isnull(R19_PC248) and tonumber(R19_PC248) > 8 then
                    AddSuspiciousRegion(R19_PC248, l_0_15)
                    -- DECOMPILER ERROR at PC262: Overwrote pending register: R19 in 'AssignReg'

                    local l_0_29, l_0_30 = nil
                    if (R19_PC248.prot >= 16 and R19_PC248.prot <= 128) or R19_PC248.alloc_prot >= 16 and R19_PC248.alloc_prot <= 128 then
                      (table.insert)(l_0_23, (string.format)("{BaseAddress=%s;Size=%s;State=%x;Prot=%x;AllocProt=%x;}", l_0_29, R19_PC248.size, R19_PC248.state_type, R19_PC248.prot, R19_PC248.alloc_prot))
                    end
                  end
                end
              end
              -- DECOMPILER ERROR at PC294: Confused about usage of register: R10 in 'UnsetPending'

              if isnull(l_0_23) then
                return mp.CLEAN
              end
              -- DECOMPILER ERROR at PC303: Confused about usage of register: R10 in 'UnsetPending'

              ;
              (table.sort)(l_0_23)
              -- DECOMPILER ERROR at PC307: Confused about usage of register: R10 in 'UnsetPending'

              local l_0_31 = nil
              local l_0_32 = nil
              ;
              (bm.add_related_string)("HollowedProcessDetails", (string.format)("{Name=%s;PPID=%s;WriteMethod=%s;SuspiciousRegions=[%s];}", l_0_8, l_0_15, l_0_9, (table.concat)(l_0_23, ",")), bm.RelatedStringBMReport)
              TrackPidAndTechniqueBM(l_0_10.ppid, "T1055.012", "processhollow")
              TrackPidAndTechniqueBM(l_0_15, "T1055.012", "processhollow_target")
              ;
              (bm.add_related_process)(l_0_15)
              ;
              (MpCommon.SetTaintedProcess)(l_0_15, bm.BM_TAINT_OTHER)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end

