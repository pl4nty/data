-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\631b3045d9b57\0x000000b2_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0.INIT = 1
l_0_0.CHECK_PATH = 2
l_0_0.GET_PROC_INFO = 3
l_0_0.GET_ROUTINE_ADDR = 4
l_0_0.READ_MEM = 5
l_0_0.DETECT_ARCH = 6
l_0_0.DISASSEMBLE = 7
l_0_0.ANALYZE = 8
l_0_0.FINISH = 9
local l_0_1 = l_0_0.INIT
local l_0_2, l_0_3, l_0_4, l_0_5 = nil, nil, nil, nil
local l_0_6 = {}
-- DECOMPILER ERROR at PC14: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC15: Overwrote pending register: R7 in 'AssignReg'

local l_0_7, l_0_8, l_0_9, l_0_10, l_0_11 = "AmsiOpenSession", nil, nil, nil, nil
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
                                  if l_0_1 == l_0_0.INIT then
                                    l_0_2 = (bm.get_imagepath)()
                                    if isnull(l_0_2) then
                                      l_0_1 = l_0_0.FINISH
                                      -- DECOMPILER ERROR at PC29: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC29: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC29: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC29: LeaveBlock: unexpected jumping out IF_STMT

                                    end
                                  end
                                end
                                l_0_1 = l_0_0.CHECK_PATH
                              end
                              if l_0_1 == l_0_0.CHECK_PATH then
                                l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
                                if isnull(l_0_2) then
                                  l_0_1 = l_0_0.FINISH
                                  -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_STMT

                                end
                              end
                            end
                            l_0_2 = (string.lower)(l_0_2)
                            if isnull(l_0_2) then
                              l_0_1 = l_0_0.FINISH
                              -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out IF_STMT

                            end
                          end
                          l_0_1 = l_0_0.GET_PROC_INFO
                        end
                        if l_0_1 == l_0_0.GET_PROC_INFO then
                          l_0_3 = (bm.get_current_process_startup_info)()
                          if isnull(l_0_3) then
                            l_0_1 = l_0_0.FINISH
                            -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC74: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                      end
                      l_0_4 = l_0_3.command_line
                      l_0_5 = l_0_3.ppid
                      if isnull(l_0_5) or isnull(l_0_4) then
                        l_0_1 = l_0_0.FINISH
                        -- DECOMPILER ERROR at PC88: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC88: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                    l_0_1 = l_0_0.GET_ROUTINE_ADDR
                  end
                  if l_0_1 == l_0_0.GET_ROUTINE_ADDR then
                    l_0_7 = l_0_6[1]
                    l_0_8 = (bm.GetProcAddress)(l_0_5, "amsi.dll", l_0_7)
                    if isnull(l_0_8) then
                      l_0_1 = l_0_0.FINISH
                      -- DECOMPILER ERROR at PC108: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC108: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC108: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC108: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
                l_0_1 = l_0_0.READ_MEM
              end
              if l_0_1 == l_0_0.READ_MEM then
                l_0_9 = (bm.ReadProcMem)(l_0_8, 64000, l_0_5)
                if isnull(l_0_9) then
                  l_0_1 = l_0_0.FINISH
                  -- DECOMPILER ERROR at PC127: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC127: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC127: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC127: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
            l_0_1 = l_0_0.DETECT_ARCH
          end
          if l_0_1 == l_0_0.DETECT_ARCH then
            if l_0_8 > 4294967295 then
              l_0_10 = mp.SMS_PROC_ARCH_X64
            else
              l_0_10 = mp.SMS_PROC_ARCH_X32
            end
            l_0_1 = l_0_0.DISASSEMBLE
            -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
        if l_0_1 == l_0_0.DISASSEMBLE then
          l_0_11 = (mp.x86dasm)(l_0_10, l_0_8, l_0_9, 64000, 100, l_0_8, mp.DASM_LINEAR_FLOW)
          if isnull(l_0_11) then
            l_0_1 = l_0_0.FINISH
            -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
      l_0_1 = l_0_0.ANALYZE
    end
    if l_0_1 == l_0_0.ANALYZE then
      for l_0_15,l_0_16 in pairs(l_0_11) do
        if l_0_16.opcode == 235 then
          local l_0_17 = (string.format)("[->] Function %s at 0x%02x, cpu is %d", l_0_7, l_0_8, l_0_10)
          ;
          (bm.add_related_string)("[->] MEDICATED PROCESS: ", l_0_2, bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_0_4, bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("[->] MEDICATED DETAILS", l_0_17, bm.RelatedStringBMReport)
          return mp.INFECTED
        end
      end
      l_0_1 = l_0_0.FINISH
      -- DECOMPILER ERROR at PC210: LeaveBlock: unexpected jumping out IF_THEN_STMT

      -- DECOMPILER ERROR at PC210: LeaveBlock: unexpected jumping out IF_STMT

    end
  end
  if l_0_1 == l_0_0.FINISH then
    return mp.CLEAN
  end
end
return mp.CLEAN

