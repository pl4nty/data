local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.getfilename
    L0_1 = L0_1()
    L1_1 = MpCommon
    L1_1 = L1_1.GetPersistContext
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L2_1 = nil
    L3_1 = nil
    L4_1 = nil
    if L1_1 ~= nil then
      L5_1 = ipairs
      L6_1 = L1_1
      L5_1, L6_1, L7_1 = L5_1(L6_1)
      for L8_1, L9_1 in L5_1, L6_1, L7_1 do
        L10_1 = string
        L10_1 = L10_1.match
        L11_1 = L9_1
        L12_1 = "^AppName:([%w%.]+)$"
        L10_1 = L10_1(L11_1, L12_1)
        if L10_1 ~= nil then
          L2_1 = L10_1
        end
        L11_1 = string
        L11_1 = L11_1.match
        L12_1 = L9_1
        L13_1 = "^AppVersion:([%w%.]+)$"
        L11_1 = L11_1(L12_1, L13_1)
        L10_1 = L11_1
        if L10_1 ~= nil then
          L3_1 = L10_1
        end
        L11_1 = string
        L11_1 = L11_1.match
        L12_1 = L9_1
        L13_1 = "^AppVersionStr:([%w%.]+)$"
        L11_1 = L11_1(L12_1, L13_1)
        L10_1 = L11_1
        if L10_1 ~= nil then
          L4_1 = L10_1
        end
      end
    end
    if L2_1 == nil then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = "app_version_"
    L6_1 = L2_1
    L5_1 = L5_1 .. L6_1
    L6_1 = 31536000
    L7_1 = 50
    if L3_1 ~= nil then
      L8_1 = AppendToRollingQueue
      L9_1 = L5_1
      L10_1 = L0_1
      L11_1 = L3_1
      L12_1 = L6_1
      L13_1 = L7_1
      L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
    elseif L4_1 ~= nil then
      L8_1 = AppendToRollingQueue
      L9_1 = L5_1
      L10_1 = L0_1
      L11_1 = L4_1
      L12_1 = L6_1
      L13_1 = L7_1
      L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
