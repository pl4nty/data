local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:IsDotNetAMSIScan_IIS"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "Detection:PUA:"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "Lua:PeOriginalName!"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = #L0_1
  if L1_1 ~= 0 then
    goto lbl_31
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_31::
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "Detection:"
L1_1 = L1_1(L2_1)
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L2_1, L3_1 = L2_1(L3_1, L4_1)
if not L2_1 or not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = nil
L5_1 = nil
L6_1 = #L0_1
if L6_1 == 1 then
  L6_1 = #L0_1
  L4_1 = L0_1[L6_1]
  if L4_1 ~= nil then
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = L4_1
    L6_1 = L6_1(L7_1)
    L7_1 = L6_1
    L6_1 = L6_1.match
    L8_1 = "lua:peoriginalname!(.*)$"
    L6_1 = L6_1(L7_1, L8_1)
    L4_1 = L6_1
  end
end
if L1_1 then
  L6_1 = #L1_1
  if L6_1 ~= 0 then
    L6_1 = #L1_1
    L5_1 = L1_1[L6_1]
    if L5_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      L7_1 = L6_1
      L6_1 = L6_1.match
      L8_1 = "detection:(.*)$"
      L6_1 = L6_1(L7_1, L8_1)
      L5_1 = L6_1
    end
  end
end
if L4_1 and L5_1 then
  L6_1 = TT_SendBMSigTrigger
  L7_1 = L3_1
  L8_1 = "IIS_InMemoryLoadBlocked"
  L9_1 = L5_1
  L10_1 = ";"
  L11_1 = L4_1
  L9_1 = L9_1 .. L10_1 .. L11_1
  L10_1 = 2
  L6_1(L7_1, L8_1, L9_1, L10_1)
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
