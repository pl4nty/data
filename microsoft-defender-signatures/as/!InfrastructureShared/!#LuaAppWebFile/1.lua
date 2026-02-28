local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "Lua:PeOriginalName!app_web_"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "Lua:PeOriginalName!app_web_"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if L1_1 ~= 0 then
    goto lbl_22
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_22::
L1_1 = #L0_1
if L1_1 == 1 then
  L1_1 = #L0_1
  L1_1 = L0_1[L1_1]
  L2_1 = #L1_1
  if L2_1 == 39 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
