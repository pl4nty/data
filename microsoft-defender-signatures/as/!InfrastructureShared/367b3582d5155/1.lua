-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\367b3582d5155\1.luac 

-- params : ...
-- function num : 0
if not is_excluded_parent_proc_auto() and IsSenseRelatedProc() ~= true then
  local l_0_0 = IsProcNameInParentProcessTree
  local l_0_1 = "BM"
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC14: No list found for R2 , SetList fails

end
-- DECOMPILER ERROR at PC18: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC19: Overwrote pending register: R0 in 'AssignReg'

if l_0_0 then
  return l_0_0
end
-- DECOMPILER ERROR at PC21: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC22: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC23: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC26: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC27: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC28: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC31: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC33: Overwrote pending register: R0 in 'AssignReg'

do
  if not l_0_0 and not l_0_0 then
    local l_0_3 = "csrss.exe"
  end
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R1 in 'AssignReg'

  if not l_0_0 then
    return l_0_1
  end
  -- DECOMPILER ERROR at PC39: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC41: Overwrote pending register: R1 in 'AssignReg'

  local l_0_4 = nil
  -- DECOMPILER ERROR at PC43: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC44: Overwrote pending register: R2 in 'AssignReg'

  local l_0_5 = "agentexecutor.exe"
  -- DECOMPILER ERROR at PC46: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R3 in 'AssignReg'

  local l_0_6 = "acrodist.exe"
  l_0_5 = this_sigattrlog
  l_0_5 = l_0_5[8]
  l_0_5 = l_0_5.matched
  local l_0_7 = nil
  l_0_6 = this_sigattrlog
  l_0_6 = l_0_6[9]
  l_0_6 = l_0_6.matched
  local l_0_8 = nil
  l_0_7 = this_sigattrlog
  l_0_7 = l_0_7[10]
  l_0_7 = l_0_7.matched
  local l_0_9 = nil
  if not l_0_1 and not l_0_2 and not l_0_4 and not l_0_5 and not l_0_6 and not l_0_7 then
    l_0_8 = mp
    l_0_8 = l_0_8.CLEAN
    return l_0_8
  end
  l_0_8 = bm
  l_0_8 = l_0_8.get_imagepath
  l_0_8 = l_0_8()
  local l_0_10 = nil
  l_0_9 = isnull
  l_0_10 = l_0_8
  l_0_9 = l_0_9(l_0_10)
  if l_0_9 then
    l_0_9 = mp
    l_0_9 = l_0_9.CLEAN
    return l_0_9
  end
  l_0_9 = string
  l_0_9 = l_0_9.lower
  l_0_10 = l_0_8
  l_0_9 = l_0_9(l_0_10)
  l_0_8 = l_0_9
  l_0_9 = string
  l_0_9 = l_0_9.find
  l_0_10 = l_0_8
  l_0_9 = l_0_9(l_0_10, "\\windows defender\\msmpeng.exe", 1, true)
  if not l_0_9 then
    l_0_9 = string
    l_0_9 = l_0_9.find
    l_0_10 = l_0_8
    l_0_9 = l_0_9(l_0_10, "\\windows defender advanced threat protection\\", 1, true)
  end
  if l_0_9 then
    l_0_9 = mp
    l_0_9 = l_0_9.CLEAN
    return l_0_9
  end
  l_0_9 = "unknown"
  local l_0_11 = nil
  l_0_10 = ""
  local l_0_12 = nil
  if l_0_1 then
    l_0_9 = "QueueUserAPC"
    l_0_11 = this_sigattrlog
    l_0_11 = l_0_11[5]
    l_0_11 = l_0_11.utf8p2
    if l_0_11 then
      l_0_11 = string
      l_0_11 = l_0_11.lower
      l_0_12 = this_sigattrlog
      l_0_12 = l_0_12[5]
      l_0_12 = l_0_12.utf8p2
      l_0_11 = l_0_11(l_0_12)
      l_0_10 = l_0_11
    end
  else
    if l_0_2 then
      l_0_9 = "MapViewOfSection"
      l_0_11 = this_sigattrlog
      l_0_11 = l_0_11[6]
      l_0_11 = l_0_11.utf8p2
      if l_0_11 then
        l_0_11 = string
        l_0_11 = l_0_11.lower
        l_0_12 = this_sigattrlog
        l_0_12 = l_0_12[6]
        l_0_12 = l_0_12.utf8p2
        l_0_11 = l_0_11(l_0_12)
        l_0_10 = l_0_11
      end
    else
      if l_0_4 then
        l_0_9 = "WriteProcessMemory"
        l_0_11 = this_sigattrlog
        l_0_11 = l_0_11[7]
        l_0_11 = l_0_11.utf8p2
        if l_0_11 then
          l_0_11 = string
          l_0_11 = l_0_11.lower
          l_0_12 = this_sigattrlog
          l_0_12 = l_0_12[7]
          l_0_12 = l_0_12.utf8p2
          l_0_11 = l_0_11(l_0_12)
          l_0_10 = l_0_11
        end
      else
        if l_0_5 then
          l_0_9 = "VirtualAllocEx"
          l_0_11 = this_sigattrlog
          l_0_11 = l_0_11[8]
          l_0_11 = l_0_11.utf8p2
          if l_0_11 then
            l_0_11 = string
            l_0_11 = l_0_11.lower
            l_0_12 = this_sigattrlog
            l_0_12 = l_0_12[8]
            l_0_12 = l_0_12.utf8p2
            l_0_11 = l_0_11(l_0_12)
            l_0_10 = l_0_11
          end
        else
          if l_0_6 then
            l_0_9 = "VirtualProtectEx"
            l_0_11 = this_sigattrlog
            l_0_11 = l_0_11[9]
            l_0_11 = l_0_11.utf8p2
            if l_0_11 then
              l_0_11 = string
              l_0_11 = l_0_11.lower
              l_0_12 = this_sigattrlog
              l_0_12 = l_0_12[9]
              l_0_12 = l_0_12.utf8p2
              l_0_11 = l_0_11(l_0_12)
              l_0_10 = l_0_11
            end
          else
            if l_0_7 then
              l_0_9 = "SetThreadContext"
              l_0_11 = this_sigattrlog
              l_0_11 = l_0_11[10]
              l_0_11 = l_0_11.utf8p2
              if l_0_11 then
                l_0_11 = string
                l_0_11 = l_0_11.lower
                l_0_12 = this_sigattrlog
                l_0_12 = l_0_12[10]
                l_0_12 = l_0_12.utf8p2
                l_0_11 = l_0_11(l_0_12)
                l_0_10 = l_0_11
              end
            end
          end
        end
      end
    end
  end
  l_0_11 = ""
  local l_0_13 = nil
  l_0_12 = ""
  local l_0_14 = nil
  if l_0_10 ~= "" then
    l_0_13 = pcall
    l_0_14 = string
    l_0_14 = l_0_14.match
    l_0_13 = l_0_13(l_0_14, l_0_10, "vmbaseaddress:(%d+)")
    local l_0_15, l_0_16 = nil
    if l_0_13 and l_0_14 then
      l_0_11 = 
    end
    l_0_15 = pcall
    l_0_16 = string
    l_0_16 = l_0_16.match
    l_0_15 = l_0_15(l_0_16, l_0_10, "vmregionsize:(%d+)")
    local l_0_17, l_0_18 = nil
    if l_0_15 and l_0_16 then
      l_0_12 = 
    end
    if l_0_12 == "" then
      l_0_17 = pcall
      l_0_18 = string
      l_0_18 = l_0_18.match
      l_0_17 = l_0_17(l_0_18, l_0_10, "vmbytescopied:(%d+)")
      local l_0_19, l_0_20 = nil
      if l_0_17 and l_0_18 then
        l_0_12 = 
      end
    end
    do
      if l_0_12 == "" then
        l_0_17 = pcall
        l_0_18 = string
        l_0_18 = l_0_18.match
        l_0_17 = l_0_17(l_0_18, l_0_10, "localvmallocregionsize:(%d+)")
        local l_0_21, l_0_22 = nil
        if l_0_17 and l_0_18 then
          l_0_12 = 
        end
      end
      do
        l_0_13 = nil
        local l_0_23 = nil
        l_0_14 = this_sigattrlog
        l_0_14 = l_0_14[2]
        l_0_14 = l_0_14.matched
        if l_0_14 then
          l_0_14 = this_sigattrlog
          l_0_14 = l_0_14[2]
          l_0_14 = l_0_14.utf8p2
          if l_0_14 ~= nil then
            l_0_14 = this_sigattrlog
            l_0_14 = l_0_14[2]
            l_0_13 = l_0_14.utf8p2
          else
            l_0_14 = this_sigattrlog
            l_0_14 = l_0_14[3]
            l_0_14 = l_0_14.matched
            if l_0_14 then
              l_0_14 = this_sigattrlog
              l_0_14 = l_0_14[3]
              l_0_14 = l_0_14.utf8p2
              if l_0_14 ~= nil then
                l_0_14 = this_sigattrlog
                l_0_14 = l_0_14[3]
                l_0_13 = l_0_14.utf8p2
              else
                l_0_14 = this_sigattrlog
                l_0_14 = l_0_14[4]
                l_0_14 = l_0_14.matched
                if l_0_14 then
                  l_0_14 = this_sigattrlog
                  l_0_14 = l_0_14[4]
                  l_0_14 = l_0_14.utf8p2
                  if l_0_14 ~= nil then
                    l_0_14 = this_sigattrlog
                    l_0_14 = l_0_14[4]
                    l_0_13 = l_0_14.utf8p2
                  end
                end
              end
              if l_0_13 ~= nil then
                l_0_14 = mp
                l_0_14 = l_0_14.GetExecutablesFromCommandLine
                l_0_23 = string
                l_0_23 = l_0_23.lower
                l_0_14 = l_0_14(l_0_23(l_0_13))
                local l_0_24 = nil
                for l_0_28,l_0_29 in ipairs(l_0_24) do
                  local l_0_28, l_0_29 = nil
                  l_0_28 = sysio
                  l_0_28 = l_0_28.IsFileExists
                  l_0_29 = l_0_27
                  l_0_28 = l_0_28(l_0_29)
                  if l_0_28 then
                    l_0_28 = string
                    l_0_28 = l_0_28.find
                    l_0_29 = l_0_27
                    l_0_28 = l_0_28(l_0_29, ".dll", 1, true)
                    if l_0_28 == nil then
                      l_0_28 = bm
                      l_0_28 = l_0_28.add_related_file
                      l_0_29 = l_0_27
                      l_0_28(l_0_29)
                    end
                  end
                end
              end
              do
                l_0_14 = bm
                l_0_14 = l_0_14.add_related_string
                -- DECOMPILER ERROR at PC337: Overwrote pending register: R15 in 'AssignReg'

                l_0_14("INJECTION_TECHNIQUE: ", l_0_24, bm.RelatedStringBMReport)
                l_0_14 = bm
                l_0_14 = l_0_14.add_related_string
                l_0_14("SOURCE_IMAGE: ", l_0_8, bm.RelatedStringBMReport)
                if l_0_11 ~= "" then
                  l_0_14 = bm
                  l_0_14 = l_0_14.add_related_string
                  l_0_14("SHELLCODE_ADDRESS: ", l_0_11, bm.RelatedStringBMReport)
                end
                if l_0_12 ~= "" then
                  l_0_14 = bm
                  l_0_14 = l_0_14.add_related_string
                  l_0_14("SHELLCODE_SIZE: ", l_0_12, bm.RelatedStringBMReport)
                end
                l_0_14 = TrackPidAndTechniqueBM
                l_0_14("BM", "T1055", "Behavior:Win32/SusPowerShellExecution.AM")
                l_0_14 = bm
                l_0_14 = l_0_14.add_action
                l_0_14("SmsAsyncScanEvent", 5000)
                l_0_14 = bm
                l_0_14 = l_0_14.add_action
                l_0_14("EmsScan", 1000)
                l_0_14 = add_parents
                l_0_14()
                l_0_14 = mp
                l_0_14 = l_0_14.INFECTED
                do return l_0_14 end
                -- DECOMPILER ERROR at PC386: Confused about usage of register R15 for local variables in 'ReleaseLocals'

              end
            end
          end
        end
      end
    end
  end
end

