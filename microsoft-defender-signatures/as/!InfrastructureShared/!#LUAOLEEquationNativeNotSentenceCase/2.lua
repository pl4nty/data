local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 200000 or 1000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "E%zq%zu%za%zt%zi%zo%zn%z %zN%za%zt%zi%zv%ze"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "[Ee]%z[Qq]%z[Uu]%z[Aa]%z[Tt]%z[Ii]%z[Oo]%z[Nn]%z %z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "\001%zO%zl%ze%z1%z0%zN%za%zt%zi%zv%ze"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "\001%z[Oo]%z[Ll]%z[Ee]%z1%z0%z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:OLE.Ole10Native.NotSentenceCase"
    L2_1(L3_1)
  end
end
if L0_1 < 500000 or 1000000 < L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = tostring
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = L0_1 - 8192
L5_1 = 4096
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "E%zq%zu%za%zt%zi%zo%zn%z %zN%za%zt%zi%zv%ze"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "[Ee]%z[Qq]%z[Uu]%z[Aa]%z[Tt]%z[Ii]%z[Oo]%z[Nn]%z %z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "\001%zO%zl%ze%z1%z0%zN%za%zt%zi%zv%ze"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "\001%z[Oo]%z[Ll]%z[Ee]%z1%z0%z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:OLE.Ole10Native.NotSentenceCase"
    L2_1(L3_1)
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
