-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\34ab3127ea865\0x000003e6_luac 

-- params : ...
-- function num : 0
if not is_excluded_parent_proc_auto() and IsSenseRelatedProc() ~= true then
  local l_0_0 = IsProcNameInParentProcessTree
  local l_0_1 = "BM"
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC13: No list found for R2 , SetList fails

end
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC18: Overwrote pending register: R0 in 'AssignReg'

if l_0_0 then
  return l_0_0
end
-- DECOMPILER ERROR at PC20: Overwrote pending register: R0 in 'AssignReg'

local l_0_3 = "acrodist.exe"
-- DECOMPILER ERROR at PC22: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC23: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC26: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC27: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC28: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC29: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC30: Overwrote pending register: R1 in 'AssignReg'

if l_0_1 then
  local l_0_4, l_0_5 = "csrss.exe"
  -- DECOMPILER ERROR at PC34: Overwrote pending register: R3 in 'AssignReg'

  l_0_4 = l_0_1
  l_0_3 = l_0_3(l_0_4)
  if not l_0_3 then
    l_0_3 = isnull
    l_0_4 = 
    l_0_3 = l_0_3(l_0_4)
  end
  if l_0_3 then
    l_0_3 = mp
    l_0_3 = l_0_3.CLEAN
    return l_0_3
  end
  l_0_3 = tonumber
  l_0_4 = l_0_1
  l_0_3 = l_0_3(l_0_4)
  -- DECOMPILER ERROR at PC50: Overwrote pending register: R1 in 'AssignReg'

  l_0_3 = tonumber
  l_0_4 = 
  l_0_3 = l_0_3(l_0_4)
  -- DECOMPILER ERROR at PC54: Overwrote pending register: R2 in 'AssignReg'

  l_0_3 = bm
  l_0_3 = l_0_3.get_current_process_startup_info
  l_0_3 = l_0_3()
  local l_0_6 = nil
  l_0_4 = isnull
  l_0_5 = l_0_3
  l_0_4 = l_0_4(l_0_5)
  if l_0_4 then
    l_0_4 = mp
    l_0_4 = l_0_4.CLEAN
    return l_0_4
  end
  l_0_4 = l_0_3.ppid
  local l_0_7 = nil
  l_0_5 = "EtwEventWrite"
  local l_0_8 = nil
  l_0_6 = bm
  l_0_6 = l_0_6.GetProcAddress
  l_0_7 = l_0_4
  l_0_8 = "ntdll.dll"
  l_0_6 = l_0_6(l_0_7, l_0_8, l_0_5)
  local l_0_9 = nil
  l_0_7 = isnull
  l_0_8 = l_0_6
  l_0_7 = l_0_7(l_0_8)
  if l_0_7 then
    l_0_7 = mp
    l_0_7 = l_0_7.CLEAN
    return l_0_7
  end
  l_0_7 = bm
  l_0_7 = l_0_7.VirtualQuery
  l_0_8 = l_0_6
  l_0_7 = l_0_7(l_0_8)
  local l_0_10, l_0_11 = nil
  if l_0_7 then
    l_0_9 = isnull
    l_0_10 = 
    l_0_9 = l_0_9(l_0_10)
  end
  if l_0_9 then
    l_0_9 = mp
    l_0_9 = l_0_9.CLEAN
    return l_0_9
  end
  l_0_9 = l_0_8.base_addr
  if l_0_9 == l_0_1 then
    l_0_9 = bm
    l_0_9 = l_0_9.get_imagepath
    l_0_9 = l_0_9()
    local l_0_12 = nil
    l_0_10 = isnull
    l_0_11 = l_0_9
    l_0_10 = l_0_10(l_0_11)
    if l_0_10 then
      l_0_10 = mp
      l_0_10 = l_0_10.CLEAN
      return l_0_10
    end
    l_0_10 = checkFileLastWriteTime
    l_0_11 = l_0_9
    l_0_12 = 300
    l_0_10 = l_0_10(l_0_11, l_0_12)
    if l_0_10 then
      local l_0_13 = nil
      l_0_11, l_0_10 = l_0_10.INIT, {INIT = 1, CHECK_PATH = 2, GET_PROC_INFO = 3, GET_ROUTINE_ADDR = 4, READ_MEM = 5, DETECT_ARCH = 6, DISASSEMBLE = 7, ANALYZE = 8, FINISH = 9}
      local l_0_18, l_0_19, l_0_20, l_0_21 = nil, nil
      while 1 do
        while 1 do
          while 1 do
            while 1 do
              while 1 do
                while 1 do
                  while 1 do
                    while 1 do
                      while 1 do
                        while 1 do
                          while 1 do
                            while 1 do
                              while 1 do
                                while 1 do
                                  while 1 do
                                    while 1 do
                                      while 1 do
                                        l_0_20 = l_0_10.INIT
                                        if l_0_11 == l_0_20 then
                                          l_0_20 = isnull
                                          l_0_21 = l_0_9
                                          l_0_20 = l_0_20(l_0_21)
                                          if l_0_20 then
                                            l_0_11 = l_0_10.FINISH
                                            do
                                              local l_0_14, l_0_15 = nil
                                              -- DECOMPILER ERROR at PC137: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC137: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC137: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC137: LeaveBlock: unexpected jumping out IF_STMT

                                            end
                                          end
                                        end
                                      end
                                      l_0_11 = l_0_10.CHECK_PATH
                                    end
                                    l_0_20 = l_0_10.CHECK_PATH
                                    if l_0_11 == l_0_20 then
                                      l_0_20 = MpCommon
                                      l_0_20 = l_0_20.PathToWin32Path
                                      l_0_21 = l_0_9
                                      l_0_20 = l_0_20(l_0_21)
                                      l_0_9 = l_0_20
                                      l_0_20 = isnull
                                      l_0_21 = l_0_9
                                      l_0_20 = l_0_20(l_0_21)
                                      if l_0_20 then
                                        l_0_11 = l_0_10.FINISH
                                        do
                                          local l_0_16 = nil
                                          -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                          -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                          -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                          -- DECOMPILER ERROR at PC154: LeaveBlock: unexpected jumping out IF_STMT

                                        end
                                      end
                                    end
                                  end
                                  l_0_20 = string
                                  l_0_20 = l_0_20.lower
                                  l_0_21 = l_0_9
                                  l_0_20 = l_0_20(l_0_21)
                                  l_0_9 = l_0_20
                                  l_0_20 = isnull
                                  l_0_21 = l_0_9
                                  l_0_20 = l_0_20(l_0_21)
                                  if l_0_20 then
                                    l_0_11 = l_0_10.FINISH
                                    -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC166: LeaveBlock: unexpected jumping out IF_STMT

                                  end
                                end
                                l_0_11 = l_0_10.GET_PROC_INFO
                              end
                              l_0_20 = l_0_10.GET_PROC_INFO
                              if l_0_11 == l_0_20 then
                                l_0_20 = isnull
                                l_0_21 = l_0_3
                                l_0_20 = l_0_20(l_0_21)
                                if l_0_20 then
                                  l_0_11 = l_0_10.FINISH
                                  do
                                    local l_0_17 = nil
                                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                                  end
                                end
                              end
                            end
                            -- DECOMPILER ERROR at PC179: Overwrote pending register: R12 in 'AssignReg'

                            l_0_20 = isnull
                            l_0_21 = l_0_4
                            l_0_20 = l_0_20(l_0_21)
                            if not l_0_20 then
                              l_0_20 = isnull
                              l_0_21 = l_0_12
                              l_0_20 = l_0_20(l_0_21)
                            end
                            if l_0_20 then
                              l_0_11 = l_0_10.FINISH
                              -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC191: LeaveBlock: unexpected jumping out IF_STMT

                            end
                          end
                          l_0_11 = l_0_10.GET_ROUTINE_ADDR
                        end
                        l_0_20 = l_0_10.GET_ROUTINE_ADDR
                        if l_0_11 == l_0_20 then
                          l_0_20 = isnull
                          l_0_21 = l_0_6
                          l_0_20 = l_0_20(l_0_21)
                          if l_0_20 then
                            l_0_11 = l_0_10.FINISH
                            -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                      end
                      l_0_11 = l_0_10.READ_MEM
                    end
                    l_0_20 = l_0_10.READ_MEM
                    if l_0_11 == l_0_20 then
                      l_0_20 = bm
                      l_0_20 = l_0_20.ReadProcMem
                      l_0_21 = l_0_6
                      l_0_20 = l_0_20(l_0_21, 64000, l_0_4)
                      -- DECOMPILER ERROR at PC215: Overwrote pending register: R13 in 'AssignReg'

                      l_0_20 = isnull
                      l_0_21 = l_0_13
                      l_0_20 = l_0_20(l_0_21)
                      if l_0_20 then
                        l_0_11 = l_0_10.FINISH
                        -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC222: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                  l_0_11 = l_0_10.DETECT_ARCH
                end
                l_0_20 = l_0_10.DETECT_ARCH
                if l_0_11 == l_0_20 then
                  if l_0_6 > 4294967295 then
                    l_0_20 = mp
                    l_0_18 = l_0_20.SMS_PROC_ARCH_X64
                  else
                    l_0_20 = mp
                    l_0_18 = l_0_20.SMS_PROC_ARCH_X32
                  end
                  l_0_11 = l_0_10.DISASSEMBLE
                  -- DECOMPILER ERROR at PC236: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC236: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
              l_0_20 = l_0_10.DISASSEMBLE
              if l_0_11 == l_0_20 then
                l_0_20 = mp
                l_0_20 = l_0_20.x86dasm
                l_0_21 = l_0_18
                l_0_20 = l_0_20(l_0_21, l_0_6, l_0_13, 64000, 100, l_0_6, mp.DASM_LINEAR_FLOW)
                l_0_19 = l_0_20
                l_0_20 = isnull
                l_0_21 = l_0_19
                l_0_20 = l_0_20(l_0_21)
                if l_0_20 then
                  l_0_11 = l_0_10.FINISH
                  -- DECOMPILER ERROR at PC258: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC258: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC258: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC258: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
            l_0_11 = l_0_10.ANALYZE
          end
          l_0_20 = l_0_10.ANALYZE
          if l_0_11 == l_0_20 then
            l_0_20 = pairs
            l_0_21 = l_0_19
            l_0_20 = l_0_20(l_0_21)
            for l_0_25,l_0_26 in l_0_20 do
              local l_0_25, l_0_26 = nil
              l_0_25 = l_0_24.opcode
              if l_0_25 ~= 195 then
                l_0_25 = l_0_24.opcode
              end
              if l_0_25 == 194 then
                l_0_25 = string
                l_0_25 = l_0_25.format
                l_0_26 = "[->] Function %s at 0x%02x, cpu is %d"
                l_0_25 = l_0_25(l_0_26, l_0_5, l_0_6, l_0_18)
                local l_0_27 = nil
                l_0_26 = bm
                l_0_26 = l_0_26.add_related_string
                l_0_27 = "[->] MEDICATED PROCESS: "
                l_0_26(l_0_27, l_0_9, bm.RelatedStringBMReport)
                l_0_26 = bm
                l_0_26 = l_0_26.add_related_string
                l_0_27 = "[->] MEDICATED COMMAND LINE: "
                l_0_26(l_0_27, l_0_12, bm.RelatedStringBMReport)
                l_0_26 = bm
                l_0_26 = l_0_26.add_related_string
                l_0_27 = "[->] MEDICATED DETAILS"
                l_0_26(l_0_27, l_0_25, bm.RelatedStringBMReport)
                l_0_26 = mp
                l_0_26 = l_0_26.INFECTED
                return l_0_26
              end
            end
            l_0_11 = l_0_10.FINISH
            -- DECOMPILER ERROR at PC308: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC308: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
        if l_0_11 == l_0_10.FINISH then
          do return mp.CLEAN end
          -- DECOMPILER ERROR at PC315: Confused about usage of register R17 for local variables in 'ReleaseLocals'

        end
      end
    end
  end
  l_0_9 = mp
  l_0_9 = l_0_9.CLEAN
  do return l_0_9 end
  -- DECOMPILER ERROR at PC319: Confused about usage of register R16 for local variables in 'ReleaseLocals'

end

