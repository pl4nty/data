local L0_1, L1_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  
  function L0_2(A0_3)
    local L1_3, L2_3
    if A0_3 == "true" then
      L1_3 = true
      return L1_3
    end
    if A0_3 == "false" then
      L1_3 = false
      return L1_3
    end
    L1_3 = tonumber
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if L1_3 then
      L1_3 = tonumber
      L2_3 = A0_3
      return L1_3(L2_3)
    end
    return A0_3
  end
  
  L1_2 = {}
  L2_2 = "ExtendedHvaDeviceProperties"
  L3_2 = GetRollingQueue
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil then
    L4_2 = pairs
    L5_2 = L3_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = L8_2.key
      L10_2 = L8_2.value
      if L9_2 == "DeviceRoles" then
        L11_2 = {}
        L1_2[L9_2] = L11_2
        L12_2 = L10_2
        L11_2 = L10_2.gmatch
        L13_2 = "[^%+]+"
        L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
        for L14_2 in L11_2, L12_2, L13_2 do
          L16_2 = L14_2
          L15_2 = L14_2.match
          L17_2 = "([^,]+),(.*)"
          L15_2, L16_2 = L15_2(L16_2, L17_2)
          if L15_2 then
            L17_2 = {}
            L19_2 = L16_2
            L18_2 = L16_2.gmatch
            L20_2 = "([^=,]+)=([^=,]+)"
            L18_2, L19_2, L20_2 = L18_2(L19_2, L20_2)
            for L21_2, L22_2 in L18_2, L19_2, L20_2 do
              L23_2 = L0_2
              L24_2 = L22_2
              L23_2 = L23_2(L24_2)
              L17_2[L21_2] = L23_2
            end
            L18_2 = L1_2[L9_2]
            L18_2[L15_2] = L17_2
          end
        end
      else
        L11_2 = L0_2
        L12_2 = L10_2
        L11_2 = L11_2(L12_2)
        L1_2[L9_2] = L11_2
      end
    end
  end
  return L1_2
end

ExtractDeviceProperties = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = "ExtendedHvaDeviceProperties"
  L1_2 = GetRollingQueueKeyValue
  L2_2 = L0_2
  L3_2 = "DeviceRoles"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 ~= nil then
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end

IsDeviceHVA = L0_1
