-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\42eb3be4a8483\1.luac 

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

if not l_0_0 then
  return l_0_0
end
-- DECOMPILER ERROR at PC29: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC30: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC31: Overwrote pending register: R0 in 'AssignReg'

local l_0_3 = "csrss.exe"
-- DECOMPILER ERROR at PC33: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC34: Overwrote pending register: R1 in 'AssignReg'

local l_0_4 = "agentexecutor.exe"
-- DECOMPILER ERROR at PC36: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC37: Overwrote pending register: R2 in 'AssignReg'

local l_0_5 = "acrodist.exe"
l_0_3 = this_sigattrlog
l_0_3 = l_0_3[9]
l_0_3 = l_0_3.matched
local l_0_6 = nil
l_0_4 = this_sigattrlog
l_0_4 = l_0_4[10]
l_0_4 = l_0_4.matched
local l_0_7 = nil
l_0_5 = this_sigattrlog
l_0_5 = l_0_5[11]
l_0_5 = l_0_5.matched
local l_0_8 = nil
if not l_0_0 and not l_0_1 and not l_0_2 and not l_0_3 and not l_0_4 and not l_0_5 then
  l_0_6 = mp
  l_0_6 = l_0_6.CLEAN
  return l_0_6
end
l_0_6 = bm
l_0_6 = l_0_6.get_imagepath
l_0_6 = l_0_6()
local l_0_9 = nil
if l_0_6 == nil then
  l_0_7 = mp
  l_0_7 = l_0_7.CLEAN
  return l_0_7
end
l_0_7 = string
l_0_7 = l_0_7.lower
l_0_8 = l_0_6
l_0_7 = l_0_7(l_0_8)
l_0_6 = l_0_7
l_0_7 = string
l_0_7 = l_0_7.find
l_0_8 = l_0_6
l_0_9 = "\\windows defender\\msmpeng.exe"
l_0_7 = l_0_7(l_0_8, l_0_9, 1, true)
if not l_0_7 then
  l_0_7 = string
  l_0_7 = l_0_7.find
  l_0_8 = l_0_6
  l_0_9 = "\\windows defender advanced threat protection\\"
  l_0_7 = l_0_7(l_0_8, l_0_9, 1, true)
end
if l_0_7 then
  l_0_7 = mp
  l_0_7 = l_0_7.CLEAN
  return l_0_7
end
l_0_7 = "unknown"
local l_0_10 = nil
l_0_8 = ""
local l_0_11 = nil
if l_0_0 then
  l_0_7 = "QueueUserAPC"
  l_0_9 = this_sigattrlog
  l_0_9 = l_0_9[6]
  l_0_9 = l_0_9.utf8p2
  if l_0_9 then
    l_0_9 = string
    l_0_9 = l_0_9.lower
    l_0_10 = this_sigattrlog
    l_0_10 = l_0_10[6]
    l_0_10 = l_0_10.utf8p2
    l_0_9 = l_0_9(l_0_10)
    l_0_8 = l_0_9
  end
else
  if l_0_1 then
    l_0_7 = "MapViewOfSection"
    l_0_9 = this_sigattrlog
    l_0_9 = l_0_9[7]
    l_0_9 = l_0_9.utf8p2
    if l_0_9 then
      l_0_9 = string
      l_0_9 = l_0_9.lower
      l_0_10 = this_sigattrlog
      l_0_10 = l_0_10[7]
      l_0_10 = l_0_10.utf8p2
      l_0_9 = l_0_9(l_0_10)
      l_0_8 = l_0_9
    end
  else
    if l_0_2 then
      l_0_7 = "WriteProcessMemory"
      l_0_9 = this_sigattrlog
      l_0_9 = l_0_9[8]
      l_0_9 = l_0_9.utf8p2
      if l_0_9 then
        l_0_9 = string
        l_0_9 = l_0_9.lower
        l_0_10 = this_sigattrlog
        l_0_10 = l_0_10[8]
        l_0_10 = l_0_10.utf8p2
        l_0_9 = l_0_9(l_0_10)
        l_0_8 = l_0_9
      end
    else
      if l_0_3 then
        l_0_7 = "VirtualAllocEx"
        l_0_9 = this_sigattrlog
        l_0_9 = l_0_9[9]
        l_0_9 = l_0_9.utf8p2
        if l_0_9 then
          l_0_9 = string
          l_0_9 = l_0_9.lower
          l_0_10 = this_sigattrlog
          l_0_10 = l_0_10[9]
          l_0_10 = l_0_10.utf8p2
          l_0_9 = l_0_9(l_0_10)
          l_0_8 = l_0_9
        end
      else
        if l_0_4 then
          l_0_7 = "VirtualProtectEx"
          l_0_9 = this_sigattrlog
          l_0_9 = l_0_9[10]
          l_0_9 = l_0_9.utf8p2
          if l_0_9 then
            l_0_9 = string
            l_0_9 = l_0_9.lower
            l_0_10 = this_sigattrlog
            l_0_10 = l_0_10[10]
            l_0_10 = l_0_10.utf8p2
            l_0_9 = l_0_9(l_0_10)
            l_0_8 = l_0_9
          end
        else
          if l_0_5 then
            l_0_7 = "SetThreadContext"
            l_0_9 = this_sigattrlog
            l_0_9 = l_0_9[11]
            l_0_9 = l_0_9.utf8p2
            if l_0_9 then
              l_0_9 = string
              l_0_9 = l_0_9.lower
              l_0_10 = this_sigattrlog
              l_0_10 = l_0_10[11]
              l_0_10 = l_0_10.utf8p2
              l_0_9 = l_0_9(l_0_10)
              l_0_8 = l_0_9
            end
          end
        end
      end
    end
  end
end
l_0_9 = ""
local l_0_12 = nil
l_0_10 = ""
local l_0_13 = nil
if l_0_8 ~= "" then
  l_0_11 = pcall
  l_0_12 = string
  l_0_12 = l_0_12.match
  l_0_13 = l_0_8
  l_0_11 = l_0_11(l_0_12, l_0_13, "vmbaseaddress:(%d+)")
  local l_0_14, l_0_15 = nil
  if l_0_11 and l_0_12 then
    l_0_9 = 
  end
  l_0_13 = pcall
  l_0_14 = string
  l_0_14 = l_0_14.match
  l_0_15 = l_0_8
  l_0_13 = l_0_13(l_0_14, l_0_15, "vmregionsize:(%d+)")
  local l_0_16, l_0_17 = nil
  if l_0_13 and l_0_14 then
    l_0_10 = 
  end
  if l_0_10 == "" then
    l_0_15 = pcall
    l_0_16 = string
    l_0_16 = l_0_16.match
    l_0_17 = l_0_8
    l_0_15 = l_0_15(l_0_16, l_0_17, "vmbytescopied:(%d+)")
    local l_0_18, l_0_19 = nil
    if l_0_15 and l_0_16 then
      l_0_10 = 
    end
  end
  do
    if l_0_10 == "" then
      l_0_15 = pcall
      l_0_16 = string
      l_0_16 = l_0_16.match
      l_0_17 = l_0_8
      l_0_15 = l_0_15(l_0_16, l_0_17, "localvmallocregionsize:(%d+)")
      local l_0_20, l_0_21 = nil
      if l_0_15 and l_0_16 then
        l_0_10 = 
      end
    end
    do
      l_0_11 = this_sigattrlog
      l_0_11 = l_0_11[2]
      l_0_11 = l_0_11.utf8p2
      if l_0_11 ~= nil then
        l_0_11 = mp
        l_0_11 = l_0_11.GetExecutablesFromCommandLine
        l_0_12 = this_sigattrlog
        l_0_12 = l_0_12[2]
        l_0_12 = l_0_12.utf8p2
        l_0_11 = l_0_11(l_0_12)
        local l_0_22 = nil
        l_0_12 = ipairs
        l_0_13 = l_0_11
        l_0_12 = l_0_12(l_0_13)
        for l_0_26,l_0_27 in l_0_12 do
          local l_0_25, l_0_26, l_0_27 = nil
          l_0_25 = sysio
          l_0_25 = l_0_25.IsFileExists
          l_0_26 = 
          l_0_25 = l_0_25(l_0_26)
          if l_0_25 then
            l_0_25 = bm
            l_0_25 = l_0_25.add_related_file
            l_0_26 = 
            l_0_25(l_0_26)
          end
        end
      end
      do
        l_0_11 = bm
        l_0_11 = l_0_11.add_related_string
        l_0_11("INJECTION_TECHNIQUE: ", l_0_7, bm.RelatedStringBMReport)
        l_0_11 = bm
        l_0_11 = l_0_11.add_related_string
        l_0_11("SOURCE_IMAGE: ", l_0_6, bm.RelatedStringBMReport)
        if l_0_9 ~= "" then
          l_0_11 = bm
          l_0_11 = l_0_11.add_related_string
          l_0_11("SHELLCODE_ADDRESS: ", l_0_9, bm.RelatedStringBMReport)
        end
        if l_0_10 ~= "" then
          l_0_11 = bm
          l_0_11 = l_0_11.add_related_string
          l_0_11("SHELLCODE_SIZE: ", l_0_10, bm.RelatedStringBMReport)
        end
        l_0_11 = TrackPidAndTechniqueBM
        l_0_11("BM", "T1055", "Behavior:Win32/SusPowerShellExecution.MK!Ofn")
        l_0_11 = bm
        l_0_11 = l_0_11.add_action
        l_0_11("SmsAsyncScanEvent", 5000)
        l_0_11 = bm
        l_0_11 = l_0_11.add_action
        l_0_11("EmsScan", 1000)
        l_0_11 = add_parents
        l_0_11()
        l_0_11 = mp
        l_0_11 = l_0_11.INFECTED
        do return l_0_11 end
        -- DECOMPILER ERROR at PC324: Confused about usage of register R14 for local variables in 'ReleaseLocals'

      end
    end
  end
end

