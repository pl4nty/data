local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L2_1, L3_1 = L2_1(L3_1)
if L2_1 and L3_1 ~= nil then
  L0_1 = L3_1.ppid
  L1_1 = L3_1.image_path
end
if L0_1 ~= nil and L1_1 ~= nil then
  L5_1 = L1_1
  L4_1 = L1_1.match
  L6_1 = "([^\\]+)$"
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = {}
  L5_1["winlogon.exe"] = true
  L5_1["explorer.exe"] = true
  L5_1["sihost.exe"] = true
  L6_1 = L5_1[L4_1]
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = IsPidExcluded
  L7_1 = L0_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = IsTacticObservedForPid
  L7_1 = L0_1
  L8_1 = "webshell_parent"
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    L6_1 = IsTacticObservedForPid
    L7_1 = L0_1
    L8_1 = "webshell_childproc"
    L6_1 = L6_1(L7_1, L8_1)
    if not L6_1 then
      goto lbl_51
    end
  end
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  do return L6_1 end
  ::lbl_51::
  L6_1 = TrackPidAndTechnique
  L7_1 = L0_1
  L8_1 = "T1218.011"
  L9_1 = "lolbin_rundll"
  L6_1(L7_1, L8_1, L9_1)
end
L4_1 = mp
L4_1 = L4_1.LOWFI
return L4_1
