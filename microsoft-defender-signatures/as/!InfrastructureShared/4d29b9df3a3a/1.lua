local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "OfficeTemplateRepChecked"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Detection:TrojanDownloader:O97M/BadTemplate.D"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "//AGGR:OfficeFileOLE_1"
    L0_1 = L0_1(L1_1)
    if L0_1 then
      goto lbl_22
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_22::
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "//SCPT:OleExternalRelationship.Template"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.GetBruteMatchData
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.GetNormalizedScript
L2_1 = L0_1.is_header
L1_1 = L1_1(L2_1)
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = string
L3_1 = L3_1.gmatch
L4_1 = L1_1
L5_1 = "Target=\"([Hh][Tt][Tt][Pp][Ss]?:[^\"]-)\""
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
for L6_1 in L3_1, L4_1, L5_1 do
  L7_1 = L2_1[L6_1]
  if L7_1 == nil then
    L7_1 = table
    L7_1 = L7_1.insert
    L8_1 = L2_1
    L9_1 = L6_1
    L7_1(L8_1, L9_1)
  end
end
if L2_1 ~= nil then
  L3_1 = #L2_1
  if L3_1 ~= 0 then
    goto lbl_65
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_65::
L3_1 = {}
L3_1.SIG_CONTEXT = "Office External Template"
L3_1.CONTENT_SOURCE = "Office External Template"
L3_1.PROCESS_CONTEXT = "Office"
L3_1.PARENT_CONTEXT = nil
L3_1.FILELESS = "false"
L3_1.CMDLINE_URL = "false"
L3_1.BREAK_AT_FIRST_HIT_MALWARE = "60"
L3_1.BREAK_AT_FIRST_HIT_PHISH = "60"
L4_1 = mp
L4_1 = L4_1.get_mpattribute
L5_1 = "InEmail"
L4_1 = L4_1(L5_1)
if L4_1 then
  L3_1.TAG = "Email"
end
L4_1 = CheckUrlReputationSimple
L5_1 = L2_1
L6_1 = L3_1
L7_1 = 60
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
