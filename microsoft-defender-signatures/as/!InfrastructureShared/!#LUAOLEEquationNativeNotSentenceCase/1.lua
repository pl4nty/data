local L0_1, L1_1, L2_1, L3_1
L0_1 = tostring
L1_1 = headerpage
L0_1 = L0_1(L1_1)
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "E%zq%zu%za%zt%zi%zo%zn%z %zN%za%zt%zi%zv%ze"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "[Ee]%z[Qq]%z[Uu]%z[Aa]%z[Tt]%z[Ii]%z[Oo]%z[Nn]%z %z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= nil then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "\001%zO%zl%ze%z1%z0%zN%za%zt%zi%zv%ze"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "\001%z[Oo]%z[Ll]%z[Ee]%z1%z0%z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= nil then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:OLE.Ole10Native.NotSentenceCase"
    L1_1(L2_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
