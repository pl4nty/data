-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\656b37e9a1d61\1.luac 

-- params : ...
-- function num : 0
if not is_excluded_parent_proc_auto() and IsSenseRelatedProc() ~= true then
  local l_0_0 = IsProcNameInParentProcessTree
  local l_0_1 = "BM"
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC15: No list found for R2 , SetList fails

end
-- DECOMPILER ERROR at PC19: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC20: Overwrote pending register: R0 in 'AssignReg'

if l_0_0 then
  return l_0_0
end
-- DECOMPILER ERROR at PC22: Overwrote pending register: R0 in 'AssignReg'

local l_0_3 = "csrss.exe"
-- DECOMPILER ERROR at PC24: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC25: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC28: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC29: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC30: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC33: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC34: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC37: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC38: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC42: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC43: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC46: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC47: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC49: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC50: Overwrote pending register: R1 in 'AssignReg'

if (l_0_1 and not l_0_1) or l_0_1 then
  local l_0_4, l_0_5 = "aw.protectionagent.powershellexecutor64.exe", "vmware.hub.sfdagent.deploycmd.exe"
  -- DECOMPILER ERROR at PC54: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC60: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC64: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R3 in 'AssignReg'

  if l_0_3 or l_0_3 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC67: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC70: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC71: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC74: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R3 in 'AssignReg'

  local l_0_6 = "agentexecutor.exe"
  -- DECOMPILER ERROR at PC78: Overwrote pending register: R4 in 'AssignReg'

  l_0_5 = l_0_3
  l_0_4 = l_0_4(l_0_5)
  if l_0_4 then
    l_0_4 = mp
    l_0_4 = l_0_4.CLEAN
    return l_0_4
  end
  l_0_4 = l_0_3.ppid
  local l_0_7 = nil
  l_0_5 = bm
  l_0_5 = l_0_5.GetProcAddress
  l_0_6 = l_0_4
  l_0_7 = "rpcrt4.dll"
  l_0_5 = l_0_5(l_0_6, l_0_7, "NdrClientCall3")
  local l_0_8 = nil
  l_0_6 = isnull
  l_0_7 = l_0_5
  l_0_6 = l_0_6(l_0_7)
  if l_0_6 then
    l_0_6 = mp
    l_0_6 = l_0_6.CLEAN
    return l_0_6
  end
  l_0_6 = bm
  l_0_6 = l_0_6.VirtualQuery
  l_0_7 = l_0_5
  l_0_6 = l_0_6(l_0_7)
  local l_0_9, l_0_10 = nil
  if l_0_6 then
    l_0_8 = isnull
    l_0_9 = 
    l_0_8 = l_0_8(l_0_9)
  end
  if l_0_8 then
    l_0_8 = mp
    l_0_8 = l_0_8.CLEAN
    return l_0_8
  end
  l_0_8 = l_0_7.base_addr
  if l_0_8 == l_0_1 then
    l_0_8 = bm
    l_0_8 = l_0_8.get_imagepath
    l_0_8 = l_0_8()
    local l_0_11 = nil
    l_0_9 = isnull
    l_0_10 = l_0_8
    l_0_9 = l_0_9(l_0_10)
    if l_0_9 then
      l_0_9 = mp
      l_0_9 = l_0_9.CLEAN
      return l_0_9
    end
    l_0_9 = checkFileLastWriteTime
    l_0_10 = l_0_8
    l_0_11 = 300
    l_0_9 = l_0_9(l_0_10, l_0_11)
    if l_0_9 then
      l_0_9 = string
      l_0_9 = l_0_9.lower
      l_0_10 = l_0_3.command_line
      l_0_9 = l_0_9(l_0_10)
      local l_0_12 = nil
      l_0_10 = bm_AddRelatedFileFromCommandLine
      l_0_11 = l_0_9
      l_0_10(l_0_11, l_0_12, nil, 1)
      l_0_10 = bm
      l_0_10 = l_0_10.add_related_file
      l_0_11 = l_0_9
      l_0_10(l_0_11)
      l_0_10 = bm
      l_0_10 = l_0_10.add_related_string
      l_0_11 = "[->] MALICIOUS SCRIPT: "
      -- DECOMPILER ERROR at PC151: Overwrote pending register: R12 in 'AssignReg'

      l_0_10(l_0_11, l_0_12, bm.RelatedStringBMReport)
      l_0_10 = mp
      l_0_10 = l_0_10.INFECTED
      return l_0_10
    end
  end
  do
    l_0_8 = mp
    l_0_8 = l_0_8.CLEAN
    return l_0_8
  end
end

