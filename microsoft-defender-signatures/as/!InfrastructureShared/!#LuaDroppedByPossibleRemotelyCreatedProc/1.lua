local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = GetTacticsTableForPid
L1_1 = "RTP"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = false
L2_1 = L0_1.wmi_childproc
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:DroppedByWmiChildProc"
  L2_1(L3_1)
  L1_1 = true
else
  L2_1 = L0_1.wsmprovhost_childproc
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:DroppedByWSMChildProc"
    L2_1(L3_1)
    L1_1 = true
  else
    L2_1 = L0_1.winrshost_childproc
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:DroppedByWinrsChildProc"
      L2_1(L3_1)
      L1_1 = true
    else
      L2_1 = L0_1.ExecRemoteDroppedExe
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.set_mpattribute
        L3_1 = "Lua:DroppedByRemoteDropExeChildProc"
        L2_1(L3_1)
        L1_1 = true
      end
    end
  end
end
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
  L2_1 = L2_1(L3_1)
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L2_1
  L3_1 = L2_1.sub
  L5_1 = 1
  L6_1 = 8
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == "\\device\\" then
    L3_1 = MpCommon
    L3_1 = L3_1.PathToWin32Path
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
  end
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = AppendToRollingQueue
  L4_1 = "DroppedByPossibleRemotelyCreatedProc"
  L5_1 = L2_1
  L6_1 = nil
  L7_1 = 5000
  L3_1(L4_1, L5_1, L6_1, L7_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
