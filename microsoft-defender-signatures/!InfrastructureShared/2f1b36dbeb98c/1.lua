-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2f1b36dbeb98c\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  if (this_sigattrlog[5]).matched then
    local l_0_3, l_0_4 = , (string.match)((this_sigattrlog[5]).utf8p1, "imagename:(.+);targetprocessppid:(%d+):")
    if (this_sigattrlog[5]).utf8p1 == nil or l_0_4 == nil then
      return mp.CLEAN
    end
    local l_0_5, l_0_6 = , pcall(mp.GetPPidFromPid, R5_PC30)
    if mp.GetPPidFromPid == nil or l_0_6 == false then
      R5_PC30 = mp
      R5_PC30 = R5_PC30.CLEAN
      return R5_PC30
    end
    local l_0_7 = nil
    local l_0_8, l_0_9, l_0_10, l_0_11, l_0_12 = R5_PC30, nil, nil, nil, nil
    for l_0_16,l_0_17 in pairs(l_0_8) do
      local l_0_13 = nil
      -- DECOMPILER ERROR at PC51: Confused about usage of register: R15 in 'UnsetPending'

      l_0_9 = (bm.GetProcAddress)(l_0_7, "amsi.dll", R15_PC51)
      if l_0_9 == nil then
        return mp.CLEAN
      end
      l_0_10 = (bm.ReadProcMem)(l_0_9, 256, l_0_7)
      if l_0_10 == nil then
        return mp.CLEAN
      end
      l_0_11 = tohex(l_0_10)
      if l_0_9 > 4294967295 then
        l_0_12 = mp.SMS_PROC_ARCH_X64
      else
        l_0_12 = mp.SMS_PROC_ARCH_X32
      end
      l_0_13 = (mp.x86dasm)(l_0_12, l_0_9, l_0_10, 256, 50, l_0_9, mp.DASM_LINEAR_FLOW)
      if l_0_13 == nil then
        return mp.CLEAN
      end
      for l_0_21,l_0_22 in pairs(l_0_13) do
        -- DECOMPILER ERROR at PC103: Confused about usage of register: R20 in 'UnsetPending'

        -- DECOMPILER ERROR at PC106: Confused about usage of register: R20 in 'UnsetPending'

        do
          do
            -- DECOMPILER ERROR at PC124: Unhandled construct in 'MakeBoolean' P1

            if ((256).opcode == 195 or (256).opcode == 194) and l_0_22 < 10 then
              (bm.add_related_string)("AMSI PATCH TARGET: ", l_0_4, bm.RelatedStringBMReport)
              ;
              (bm.add_related_string)("AMSI PATCH BYTES: ", l_0_11, bm.RelatedStringBMReport)
              ;
              (bm.add_related_string)("AMSI: ", (string.format)("Function %s at 0x%02x, cpu is %d", l_0_18, l_0_9, l_0_12), bm.RelatedStringBMReport)
              TrackPidAndTechnique("BM", "T1562.006", "AMSIPatch")
              ;
              (bm.add_related_process)(l_0_7)
              return mp.INFECTED
            end
            do break end
            -- DECOMPILER ERROR at PC153: Confused about usage of register: R20 in 'UnsetPending'

            if l_0_23.jtype ~= 0 then
              break
            end
            -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
    end
    return mp.CLEAN
  end
end

