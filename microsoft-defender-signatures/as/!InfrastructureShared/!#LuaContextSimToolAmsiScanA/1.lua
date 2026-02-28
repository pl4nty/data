local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 3) then
    goto lbl_14
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_14::
L1_1 = false
L2_1 = GetTacticsCountForPid
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 ~= nil and 0 < L2_1 then
  L3_1 = IsTacticObservedForPid
  L4_1 = L0_1
  L5_1 = "simtool_childproc"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = IsTacticObservedForParents
    L4_1 = L0_1
    L5_1 = "simtool_childproc"
    L6_1 = 3
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if not L3_1 then
      goto lbl_46
    end
  end
  L3_1 = mp
  L3_1 = L3_1.get_mpattribute
  L4_1 = "MpIsPowerShellAMSIScan"
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:Context/SimToolPowerShellAMSIScan.A"
    L3_1(L4_1)
  end
  L1_1 = true
end
::lbl_46::
L3_1 = IsBasToolProcessForPpid
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L4_1 = IsBasToolProcessFoundInParents
L5_1 = L0_1
L6_1 = "Any"
L7_1 = 4
L4_1 = L4_1(L5_1, L6_1, L7_1)
L5_1 = mp
L5_1 = L5_1.get_mpattribute
L6_1 = "MpIsPowerShellAMSIScan"
L5_1 = L5_1(L6_1)
if L3_1 == true or L4_1 == true then
  L1_1 = true
  if L3_1 == true then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/BasToolAmsiProcess.A"
    L6_1(L7_1)
  end
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:Context/BasToolAmsiProcessTree.A"
  L6_1(L7_1)
  if L5_1 == true then
    if L3_1 == true then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/BasToolPowershellAmsiProcess.A"
      L6_1(L7_1)
    end
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/BasToolPowershellAmsiProcessTree.A"
    L6_1(L7_1)
  end
  L6_1 = IsBasToolProcessForPpid
  L7_1 = L0_1
  L8_1 = "Picus"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/PicusAmsiProcess.A"
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/PicusAmsiProcessTree.A"
    L6_1(L7_1)
    if L5_1 == true then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/PicusPowershellAmsiProcess.A"
      L6_1(L7_1)
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/PicusPowershellAmsiProcessTree.A"
      L6_1(L7_1)
    end
  else
    L6_1 = IsBasToolProcessFoundInParents
    L7_1 = L0_1
    L8_1 = "Picus"
    L9_1 = 4
    L6_1 = L6_1(L7_1, L8_1, L9_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/PicusAmsiProcessTree.A"
      L6_1(L7_1)
      if L5_1 == true then
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "Lua:Context/PicusPowershellAmsiProcessTree.A"
        L6_1(L7_1)
      end
    end
  end
end
if L1_1 == true then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
