local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = false
  L2_1 = nil
  L3_1 = L0_1.ppid
  if L3_1 then
    L3_1 = IsKeyInRollingQueue
    L4_1 = "IsProcessChainViaRUNMRU"
    L5_1 = L0_1.ppid
    L6_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 then
      L1_1 = true
      L2_1 = L0_1.ppid
  end
  else
    L3_1 = mp
    L3_1 = L3_1.GetParentProcInfo
    L4_1 = L0_1.ppid
    L3_1 = L3_1(L4_1)
    if L3_1 ~= nil then
      L4_1 = L3_1.ppid
      if L4_1 then
        L4_1 = IsKeyInRollingQueue
        L5_1 = "IsProcessChainViaRUNMRU"
        L6_1 = L3_1.ppid
        L7_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1)
        if L4_1 then
          L1_1 = true
          L2_1 = L3_1.ppid
        end
      end
    end
  end
  if not L1_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.GetProcessCommandLine
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "|cmd"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "| cmd"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "|c:\\windows\\system32\\cmd.exe"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "| c:\\windows\\system32\\cmd.exe"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = " do call %"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            goto lbl_106
          end
        end
      end
    end
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_106::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
