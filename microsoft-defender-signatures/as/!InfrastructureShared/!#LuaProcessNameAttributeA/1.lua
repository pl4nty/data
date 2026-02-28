local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = #L0_1
  if not (44 < L1_1) then
    goto lbl_14
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_14::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = " "
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.gsub
  L3_1 = "%s"
  L4_1 = "/x20"
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  L0_1 = L1_1
  if L0_1 ~= nil then
    L1_1 = #L0_1
    if not (44 < L1_1) then
      goto lbl_41
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_41::
L1_1 = "Lua:ProcNameAttr!"
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = L1_1
L4_1 = L0_1
L3_1 = L3_1 .. L4_1
L2_1(L3_1)
L2_1 = isLolBasFilename
L3_1 = L0_1
L2_1, L3_1 = L2_1(L3_1)
if L2_1 == true and L3_1 ~= nil then
  L4_1 = "Lua:LolbasProcessName.A"
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = L4_1
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = L4_1
  L7_1 = "!"
  L8_1 = L3_1
  L6_1 = L6_1 .. L7_1 .. L8_1
  L5_1(L6_1)
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_NEWLYCREATEDHINT
L4_1 = L4_1(L5_1)
if L4_1 == true then
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
  L4_1 = L4_1(L5_1)
  if L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.GetParentProcInfo
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 == nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = L5_1.image_path
  if L6_1 == nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L6_1
  L9_1 = "([^\\]+)$"
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 == nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L7_1
  L10_1 = " "
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L9_1 = L7_1
    L8_1 = L7_1.gsub
    L10_1 = "%s"
    L11_1 = "/x20"
    L8_1 = L8_1(L9_1, L10_1, L11_1)
    L7_1 = L8_1
    if L7_1 ~= nil then
      L8_1 = #L7_1
      if not (38 < L8_1) then
        goto lbl_131
      end
    end
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  ::lbl_131::
  L8_1 = "Lua:ParentProcNameAttr!"
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = L8_1
  L11_1 = L7_1
  L10_1 = L10_1 .. L11_1
  L9_1(L10_1)
  L9_1 = isLolBasFilename
  L10_1 = L7_1
  L9_1, L10_1 = L9_1(L10_1)
  if L9_1 == true and L10_1 ~= nil then
    L11_1 = "Lua:LolbasParentProcessName.A"
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = L11_1
    L12_1(L13_1)
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = L11_1
    L14_1 = "!"
    L15_1 = L10_1
    L13_1 = L13_1 .. L14_1 .. L15_1
    L12_1(L13_1)
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
