local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.lower
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.gsub
L4_1 = "%^"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.gsub
L4_1 = "'"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.gsub
L4_1 = "%s+"
L5_1 = " "
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = " && mshta "
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = " && curl "
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    goto lbl_67
  end
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = " in (curl "
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = " && echo "
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  ::lbl_67::
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.GetParentProcInfo
    L2_1 = L2_1()
    if L2_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1.image_path
      L3_1 = L3_1(L4_1)
      L5_1 = L3_1
      L4_1 = L3_1.match
      L6_1 = "([^\\]+)$"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 == "explorer.exe" then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
      L4_1 = L2_1.ppid
      if L4_1 then
        L4_1 = IsKeyInRollingQueue
        L5_1 = "IsProcessChainViaRUNMRU"
        L6_1 = L2_1.ppid
        L7_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1)
        if L4_1 then
          L4_1 = mp
          L4_1 = L4_1.INFECTED
          return L4_1
        end
      end
      L4_1 = mp
      L4_1 = L4_1.GetParentProcInfo
      L5_1 = L2_1.ppid
      L4_1 = L4_1(L5_1)
      if L4_1 ~= nil then
        L5_1 = L4_1.ppid
        if L5_1 then
          L5_1 = IsKeyInRollingQueue
          L6_1 = "IsProcessChainViaRUNMRU"
          L7_1 = L4_1.ppid
          L8_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1)
          if L5_1 then
            L5_1 = mp
            L5_1 = L5_1.INFECTED
            return L5_1
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
