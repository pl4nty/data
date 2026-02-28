local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = MpCommon
L1_1 = L1_1.QuerySessionInformation
L2_1 = L0_1.ppid
L3_1 = MpCommon
L3_1 = L3_1.WTSUserName
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = ""
L3_1 = false
L4_1 = false
L5_1 = pcall
L6_1 = MpCommon
L6_1 = L6_1.GetUserAccountGroups
L7_1 = ""
L8_1 = L1_1
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
L2_1 = L6_1
L3_1 = L5_1
if L3_1 and L2_1 then
  L5_1 = {}
  L5_1["Backup Operators"] = true
  L5_1["Print Operators"] = true
  L5_1["Server Operators"] = true
  L5_1["Account Operators"] = true
  L6_1 = ipairs
  L7_1 = L2_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = L10_1.Name
    L11_1 = L5_1[L11_1]
    if L11_1 then
      L4_1 = L10_1.Name
      break
    end
  end
  if L4_1 then
    L6_1 = scrubData
    L7_1 = L1_1
    L6_1 = L6_1(L7_1)
    L7_1 = bm
    L7_1 = L7_1.add_related_string
    L8_1 = "HVAUserAccount"
    L9_1 = L4_1
    L10_1 = ":"
    L11_1 = L6_1
    L9_1 = L9_1 .. L10_1 .. L11_1
    L10_1 = bm
    L10_1 = L10_1.RelatedStringBMReport
    L7_1(L8_1, L9_1, L10_1)
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
