local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = isnull
    L2_1 = L0_1.ppid
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = L0_1.image_path
      L1_1 = L1_1(L2_1)
      L3_1 = L1_1
      L2_1 = L1_1.match
      L4_1 = "([^\\]+)$"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 == "w3wp.exe" then
        L3_1 = IsDeviceHVA
        L3_1 = L3_1()
        if L3_1 then
          L3_1 = ""
          L4_1 = ExtractDeviceProperties
          L4_1 = L4_1()
          L5_1 = L4_1.DeviceRoles
          if L5_1 ~= nil then
            L5_1 = L4_1.IsInternetFacing
            if L5_1 == true then
              L5_1 = pairs
              L6_1 = L4_1.DeviceRoles
              L5_1, L6_1, L7_1 = L5_1(L6_1)
              for L8_1, L9_1 in L5_1, L6_1, L7_1 do
                L10_1 = L3_1
                L11_1 = ";"
                L12_1 = L8_1
                L3_1 = L10_1 .. L11_1 .. L12_1
              end
              L5_1 = MpCommon
              L5_1 = L5_1.BmTriggerSig
              L6_1 = L0_1.ppid
              L7_1 = "HvaRoles!WebSever"
              L8_1 = L3_1
              L5_1(L6_1, L7_1, L8_1)
              L5_1 = mp
              L5_1 = L5_1.INFECTED
              return L5_1
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
