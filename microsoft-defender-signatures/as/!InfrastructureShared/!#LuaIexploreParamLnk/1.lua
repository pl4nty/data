local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L2_1 = L0_1
L1_1 = L0_1.len
L1_1 = L1_1(L2_1)
if L1_1 < 60 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "(.+\\)([^\\]+)$"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L4_1 = L1_1
L3_1 = L1_1.len
L3_1 = L3_1(L4_1)
if 50 < L3_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = 1
  L6_1 = 21
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 ~= "internet explorer.lnk" then
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L2_1
    L5_1 = 1
    L6_1 = 34
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 ~= "internet explorer (no add-ons).lnk" then
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L2_1
      L5_1 = 1
      L6_1 = 36
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 ~= "launch internet explorer browser.lnk" then
        goto lbl_77
      end
    end
  end
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = "\\microsoft\\internet explorer\\quick launch"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L1_1
    L5_1 = -21
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= "\\start menu\\programs\\" then
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L1_1
      L5_1 = -46
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 ~= "\\start menu\\programs\\accessories\\system tools\\" then
        L3_1 = string
        L3_1 = L3_1.sub
        L4_1 = L1_1
        L5_1 = -33
        L3_1 = L3_1(L4_1, L5_1)
        if L3_1 ~= "\\start menu\\programs\\accessories\\" then
          goto lbl_77
        end
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:IexploreParamLnk"
  L3_1(L4_1)
end
::lbl_77::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
