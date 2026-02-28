local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.getfilename
  L0_1 = L0_1()
  L2_1 = L0_1
  L1_1 = L0_1.sub
  L3_1 = -4
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == ".exe" then
    L1_1 = nil
    L2_1 = {}
    L3_1 = "tray"
    L4_1 = "xpers"
    L5_1 = "mgr"
    L6_1 = "agent"
    L7_1 = "ctrl"
    L8_1 = "sync"
    L9_1 = "use"
    L10_1 = "start"
    L11_1 = "win"
    L2_1[1] = L3_1
    L2_1[2] = L4_1
    L2_1[3] = L5_1
    L2_1[4] = L6_1
    L2_1[5] = L7_1
    L2_1[6] = L8_1
    L2_1[7] = L9_1
    L2_1[8] = L10_1
    L2_1[9] = L11_1
    L4_1 = L0_1
    L3_1 = L0_1.match
    L5_1 = "([^\\]+)%..+"
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = 1
    L5_1 = #L2_1
    L6_1 = 1
    for L7_1 = L4_1, L5_1, L6_1 do
      L1_1 = L2_1[L7_1]
      L9_1 = L3_1
      L8_1 = L3_1.sub
      L10_1 = 1
      L11_1 = #L1_1
      L8_1 = L8_1(L9_1, L10_1, L11_1)
      if L8_1 ~= L1_1 then
        L9_1 = L3_1
        L8_1 = L3_1.sub
        L10_1 = 1
        L11_1 = #L1_1
        L11_1 = -L11_1
        L8_1 = L8_1(L9_1, L10_1, L11_1)
        if L8_1 ~= L1_1 then
          goto lbl_49
        end
      end
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      do return L8_1 end
      ::lbl_49::
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
