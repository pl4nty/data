local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L1_1 = L2_1.ppid
  end
end
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsPidExcluded
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = StringStartsWith
L3_1 = L0_1
L4_1 = "%"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.DisableSignature
L2_1()
L2_1 = MpCommon
L2_1 = L2_1.QueryPersistContext
L3_1 = L0_1
L4_1 = "NewPECreatedNoCert"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L3_1 = bm
  L3_1 = L3_1.trigger_sig
  L4_1 = "ExecNewlyCreatedUnsignedExe"
  L5_1 = "ExecNewlyCreatedUnsignedExe"
  L6_1 = L1_1
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = IsKeyInRollingQueue
L4_1 = "SuspExeFileDroppedViaSMB"
L5_1 = L0_1
L6_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L3_1 = bm
  L3_1 = L3_1.trigger_sig
  L4_1 = "ExecRemoteDroppedExe"
  L5_1 = "ExecRemoteDroppedExe"
  L6_1 = L1_1
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.trigger_sig
  L4_1 = "T1570"
  L5_1 = "exec_remotedroppedexe_a"
  L6_1 = L1_1
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = IsKeyInRollingQueue
L4_1 = "DroppedByPossibleRemotelyCreatedProc"
L5_1 = L0_1
L6_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L3_1 = bm
  L3_1 = L3_1.trigger_sig
  L4_1 = "T1570"
  L5_1 = "exec_remotedroppedexe_b"
  L6_1 = L1_1
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
