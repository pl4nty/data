local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 <= 1000 or 1000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L2_1
L5_1 = -3
L3_1 = L3_1(L4_1, L5_1)
L4_1 = string
L4_1 = L4_1.sub
L5_1 = L2_1
L6_1 = -4
L4_1 = L4_1(L5_1, L6_1)
if L3_1 ~= ".js" and L4_1 ~= ".jse" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = IsInternetCache
L6_1 = L1_1
L5_1 = L5_1(L6_1)
if true ~= L5_1 then
  L5_1 = IsLowConfNPath
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  if true ~= L5_1 then
    goto lbl_56
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_56::
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "Lua:JsLowfiFlag"
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
