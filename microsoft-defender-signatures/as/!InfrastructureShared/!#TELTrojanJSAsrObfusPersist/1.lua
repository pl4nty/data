local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.enum_mpattributesubstring
  L2_1 = "SCPT:JS/AsrobfusAtt"
  L1_1 = L1_1(L2_1)
  L2_1 = #L1_1
  if 1 <= L2_1 then
    L2_1 = pcall
    L3_1 = mp
    L3_1 = L3_1.get_contextdata
    L4_1 = mp
    L4_1 = L4_1.CONTEXT_DATA_AMSI_APPNAME
    L2_1, L3_1 = L2_1(L3_1, L4_1)
    if L2_1 and L3_1 == "JScript" then
      L4_1 = pcall
      L5_1 = mp
      L5_1 = L5_1.get_contextdata
      L6_1 = mp
      L6_1 = L6_1.CONTEXT_DATA_AMSI_CONTENTNAME
      L4_1, L5_1 = L4_1(L5_1, L6_1)
      if L4_1 and L5_1 ~= nil then
        L6_1 = string
        L6_1 = L6_1.lower
        L7_1 = L5_1
        L6_1 = L6_1(L7_1)
        L7_1 = MpCommon
        L7_1 = L7_1.QueryPersistContext
        L8_1 = L6_1
        L9_1 = "AsrObfusWasScanned"
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 then
          L7_1 = MpCommon
          L7_1 = L7_1.QueryPersistContext
          L8_1 = L6_1
          L9_1 = "AsrObfusPersist"
          L7_1 = L7_1(L8_1, L9_1)
          if not L7_1 then
            L7_1 = mp
            L7_1 = L7_1.INFECTED
            return L7_1
          end
        end
      end
    end
  end
else
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1()
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
  L2_1 = MpCommon
  L2_1 = L2_1.AppendPersistContext
  L3_1 = L1_1
  L4_1 = "AsrObfusWasScanned"
  L5_1 = 0
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.enum_mpattributesubstring
  L3_1 = "SCPT:JS/AsrobfusAtt"
  L2_1 = L2_1(L3_1)
  L3_1 = #L2_1
  if 1 <= L3_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.AppendPersistContext
    L4_1 = L1_1
    L5_1 = "AsrObfusPersist"
    L6_1 = 0
    L3_1(L4_1, L5_1, L6_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
