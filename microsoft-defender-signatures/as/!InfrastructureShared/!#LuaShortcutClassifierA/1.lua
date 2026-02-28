local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:LastFolder1!programs"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:LastFolder2!start/x20menu"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Lua:LastFolder3!windows"
    L0_1 = L0_1(L1_1)
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "Lua:LastFolder4!microsoft"
      L0_1 = L0_1(L1_1)
      if L0_1 then
        L0_1 = mp
        L0_1 = L0_1.get_mpattribute
        L1_1 = "Lua:LastFolder5!roaming"
        L0_1 = L0_1(L1_1)
        if L0_1 then
          L0_1 = mp
          L0_1 = L0_1.CLEAN
          return L0_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:LastFolder2!programs"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:LastFolder3!start/x20menu"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Lua:LastFolder4!windows"
    L0_1 = L0_1(L1_1)
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "Lua:LastFolder5!microsoft"
      L0_1 = L0_1(L1_1)
      if L0_1 then
        L0_1 = mp
        L0_1 = L0_1.get_mpattribute
        L1_1 = "Lua:LastFolder6!roaming"
        L0_1 = L0_1(L1_1)
        if L0_1 then
          L0_1 = mp
          L0_1 = L0_1.CLEAN
          return L0_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:ShortcutClassifierA"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = {}
  L2_1 = 100
  L3_1 = 95
  L4_1 = 90
  L5_1 = 80
  L6_1 = 70
  L7_1 = 60
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L1_1[3] = L4_1
  L1_1[4] = L5_1
  L1_1[5] = L6_1
  L1_1[6] = L7_1
  L2_1 = SetAttributeFromClassifierScoresEx
  L3_1 = L0_1
  L4_1 = L1_1
  L5_1 = "Lua:ShortcutClassifierA:"
  L2_1(L3_1, L4_1, L5_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
