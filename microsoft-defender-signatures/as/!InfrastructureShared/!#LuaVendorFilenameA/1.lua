local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 5) then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = {}
L1_1["hiphandlers.dll"] = "mcafee"
L1_1["hiphandlers64.dll"] = "mcafee"
L1_1["kevlarsigs.dll"] = "mcafee"
L1_1["kevlarsigs64.dll"] = "mcafee"
L2_1 = L1_1[L0_1]
if L2_1 ~= nil then
  L2_1 = type
  L3_1 = L1_1[L0_1]
  L2_1 = L2_1(L3_1)
  if L2_1 == "string" then
    L2_1 = "Lua:VendorFilename.A!"
    L3_1 = L1_1[L0_1]
    L2_1 = L2_1 .. L3_1
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = L2_1
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
