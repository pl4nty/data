local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = "rq_ServiceImagePaths"
L1_1 = 172800
L2_1 = 100
L3_1 = sysio
L3_1 = L3_1.EnumerateServices
L3_1 = L3_1()
L4_1 = pairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = L8_1.ServiceName
  if L9_1 then
    L10_1 = string
    L10_1 = L10_1.lower
    L11_1 = sysio
    L11_1 = L11_1.GetCommandLineFromService
    L12_1 = L9_1
    L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L11_1(L12_1)
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
    L11_1 = MpCommon
    L11_1 = L11_1.PathToWin32Path
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    L10_1 = L11_1
    if L10_1 ~= nil then
      L11_1 = IsKeyInRollingQueue
      L12_1 = L0_1
      L13_1 = L10_1
      L14_1 = true
      L11_1 = L11_1(L12_1, L13_1, L14_1)
      if not L11_1 then
        L11_1 = StringSplit
        L12_1 = L10_1
        L13_1 = " "
        L11_1 = L11_1(L12_1, L13_1)
        L13_1 = L10_1
        L12_1 = L10_1.sub
        L14_1 = 1
        L15_1 = 1
        L12_1 = L12_1(L13_1, L14_1, L15_1)
        if L12_1 ~= "\"" and L12_1 ~= "'" then
          L13_1 = StringEndsWith
          L14_1 = L11_1[1]
          L15_1 = ".exe"
          L13_1 = L13_1(L14_1, L15_1)
          if not L13_1 then
            L13_1 = StringEndsWith
            L14_1 = L11_1[1]
            L15_1 = ".sys"
            L13_1 = L13_1(L14_1, L15_1)
            if not L13_1 then
              L13_1 = AppendToRollingQueue
              L14_1 = L0_1
              L15_1 = L11_1[1]
              L16_1 = L1_1
              L17_1 = L2_1
              L13_1(L14_1, L15_1, L16_1, L17_1)
              L13_1 = mp
              L13_1 = L13_1.CLEAN
              return L13_1
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
