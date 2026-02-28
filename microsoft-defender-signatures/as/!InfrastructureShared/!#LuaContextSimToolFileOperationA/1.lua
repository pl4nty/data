local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESS_PPID
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
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
L1_1 = L1_1(L2_1)
L2_1 = false
L3_1 = GetTacticsCountForPid
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 ~= nil and 0 < L3_1 then
  L4_1 = IsTacticObservedForPid
  L5_1 = L0_1
  L6_1 = "simtool_childproc"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = IsTacticObservedForParents
    L5_1 = L0_1
    L6_1 = "simtool_childproc"
    L7_1 = 3
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if not L4_1 then
      goto lbl_47
    end
  end
  if L1_1 == true then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:Context/SimToolCreatedFile.A"
    L4_1(L5_1)
  end
  L2_1 = true
end
::lbl_47::
L4_1 = IsBasToolProcessForPpid
L5_1 = L0_1
L4_1 = L4_1(L5_1)
L5_1 = IsBasToolProcessFoundInParents
L6_1 = L0_1
L7_1 = "Any"
L8_1 = 4
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L4_1 == true or L5_1 == true then
  L2_1 = true
  if L4_1 == true then
    if L1_1 == true then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/BasToolProcCreatedFile.A"
      L6_1(L7_1)
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/BasToolProcTreeCreatedFile.A"
      L6_1(L7_1)
    end
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:ContextDataProcess/BasToolProcess.A"
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:ContextDataProcess/BasToolProcessTree.A"
    L6_1(L7_1)
  elseif L5_1 == true then
    if L1_1 == true then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/BasToolProcTreeCreatedFile.A"
      L6_1(L7_1)
    end
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:ContextDataProcess/BasToolProcessTree.A"
    L6_1(L7_1)
  end
  L6_1 = IsBasToolProcessForPpid
  L7_1 = L0_1
  L8_1 = "SafeBreach"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    if L1_1 == true then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/SafeBreachProcCreatedFile.A"
      L6_1(L7_1)
    end
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:ContextDataProcess/SafeBreachProcess.A"
    L6_1(L7_1)
  end
  L6_1 = IsBasToolProcessForPpid
  L7_1 = L0_1
  L8_1 = "AttackIQ"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    if L1_1 == true then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/AttackIQProcCreatedFile.A"
      L6_1(L7_1)
    end
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:ContextDataProcess/AttackIQProcess.A"
    L6_1(L7_1)
  end
  L6_1 = IsBasToolProcessForPpid
  L7_1 = L0_1
  L8_1 = "Picus"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    if L1_1 == true then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/PicusProcCreatedFile.A"
      L6_1(L7_1)
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:Context/PicusProcTreeCreatedFile.A"
      L6_1(L7_1)
    end
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:ContextDataProcess/PicusProcess.A"
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:ContextDataProcess/PicusProcessTree.A"
    L6_1(L7_1)
  else
    L6_1 = IsBasToolProcessFoundInParents
    L7_1 = L0_1
    L8_1 = "Picus"
    L9_1 = 4
    L6_1 = L6_1(L7_1, L8_1, L9_1)
    if L6_1 then
      if L1_1 == true then
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "Lua:Context/PicusProcTreeCreatedFile.A"
        L6_1(L7_1)
      end
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:ContextDataProcess/PicusProcessTree.A"
      L6_1(L7_1)
    end
  end
end
if L2_1 == true then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
