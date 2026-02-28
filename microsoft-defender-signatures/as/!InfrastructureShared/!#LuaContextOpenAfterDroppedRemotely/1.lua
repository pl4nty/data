local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.sub
L3_1 = 1
L4_1 = 8
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == "\\device\\" then
  L1_1 = MpCommon
  L1_1 = L1_1.PathToWin32Path
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = IsKeyInRollingQueue
L2_1 = "DroppedByPossibleRemotelyCreatedProc"
L3_1 = L0_1
L4_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
  L1_1 = L1_1(L2_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:Context/OpenAfterDroppedRemotely!"
  L4_1 = L1_1
  L3_1 = L3_1 .. L4_1
  L2_1(L3_1)
  L2_1 = "cscript.exe|wscript.exe|mshta.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|svchost.exe|wsmprovhost.exe|"
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = L1_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:Context/OpenAfterDroppedRemotely!lolbin"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:Context/OpenAfterDroppedRemotely!"
    L5_1 = L1_1
    L4_1 = L4_1 .. L5_1
    L3_1(L4_1)
  end
  L3_1 = TrackPidAndTechnique
  L4_1 = "RTP"
  L5_1 = "T1570"
  L6_1 = "exec_remotedroppedscript_b"
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
