local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.GetImagePathFromPid
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.GetOriginalFileName
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L3_1 == "finger.exe" then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L6_1 = "finger.exe"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.GetParentProcInfo
    L4_1 = L4_1()
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
      else
        L5_1 = mp
        L5_1 = L5_1.GetParentProcInfo
        L6_1 = L4_1.ppid
        L5_1 = L5_1(L6_1)
        if L5_1 ~= nil then
          L6_1 = L5_1.ppid
          if L6_1 then
            L6_1 = IsKeyInRollingQueue
            L7_1 = "IsProcessChainViaRUNMRU"
            L8_1 = L5_1.ppid
            L9_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1)
            if L6_1 then
              L6_1 = mp
              L6_1 = L6_1.INFECTED
              return L6_1
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
