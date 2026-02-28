local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "->word/_rels/"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "/drawings/_rels/"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "/worksheets/_rels/"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      goto lbl_59
    end
  end
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "->"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L1_1
L5_1 = 0
L6_1 = L2_1 - 1
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = {}
L5_1 = table
L5_1 = L5_1.insert
L6_1 = L4_1
L7_1 = L3_1
L5_1(L6_1, L7_1)
L5_1 = MpCommon
L5_1 = L5_1.SetPersistContextNoPath
L6_1 = "TemplateInjc"
L7_1 = L4_1
L8_1 = 100
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
do return L5_1 end
::lbl_59::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
