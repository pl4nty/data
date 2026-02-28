local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 20480 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.HEADERPAGE_SZ
if L1_1 < 1792 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = tostring
L3_1 = headerpage
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = 0
L5_1 = L1_1
L4_1 = L1_1.gmatch
L6_1 = "[s][e][t] [%w]+%s*=%s*[%w%.]+"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
for L7_1 in L4_1, L5_1, L6_1 do
  L9_1 = L7_1
  L8_1 = L7_1.match
  L10_1 = "([s][e][t] [%w.]+)"
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 ~= nil then
    L9_1 = #L8_1
    if 5 < L9_1 then
      L9_1 = string
      L9_1 = L9_1.sub
      L10_1 = L8_1
      L11_1 = 5
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 == nil then
        L10_1 = mp
        L10_1 = L10_1.CLEAN
        return L10_1
      end
      L10_1 = L2_1[L9_1]
      if L10_1 ~= 1 then
        L10_1 = "%"
        L11_1 = L9_1
        L12_1 = "%"
        L10_1 = L10_1 .. L11_1 .. L12_1
        L2_1[L9_1] = 1
        L12_1 = L1_1
        L11_1 = L1_1.find
        L13_1 = L10_1
        L14_1 = 1
        L15_1 = true
        L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
        if L11_1 ~= nil then
          L3_1 = L3_1 + 1
          L11_1 = mp
          L11_1 = L11_1.set_mpattribute
          L12_1 = "Lua:ScrHasEnvWithPercent"
          L11_1(L12_1)
        else
          L11_1 = mp
          L11_1 = L11_1.CLEAN
          return L11_1
        end
        if 5 < L3_1 then
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
