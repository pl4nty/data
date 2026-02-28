local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 <= 5) then
    goto lbl_15
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "--\226\156\181\225\180\152\225\180\128$$\225\180\161\195\152\202\128\240\157\146\159"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "Pa$$C\197\140\240\157\148\187e--"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\240\157\151\163\240\157\151\174\240\157\152\128\240\157\152\128\240\157\152\132\240\157\151\188\240\157\151\191\240\157\151\1772025"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "-\240\157\144\146\240\157\145\146\240\157\147\137\240\157\147\138\240\157\147\133\226\154\153\239\184\1432025"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 == nil then
        goto lbl_58
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.set_mpattribute
L2_1 = "LUA:7zHasFileNamewithPassword"
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_58::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
