local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.image_path
    L1_1 = L1_1(L2_1)
    L2_1 = contains
    L3_1 = L1_1
    L4_1 = {}
    L5_1 = "\\papercut mf\\"
    L6_1 = "\\papercut ng\\"
    L4_1[1] = L5_1
    L4_1[2] = L6_1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L0_1.image_path
      L4_1 = -10
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 == "pc-app.exe" then
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
