local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "Lua:PeOriginalName!"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = #L0_1
if L1_1 == 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pcall
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L1_1, L2_1 = L1_1(L2_1, L3_1)
if not L1_1 or not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = ipairs
L4_1 = L0_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = #L7_1
  if L8_1 == 31 then
    L8_1 = mp
    L8_1 = L8_1.get_mpattribute
    L9_1 = "LUA:PeFileVersion!15.0.0.0"
    L8_1 = L8_1(L9_1)
    if not L8_1 then
      L8_1 = mp
      L8_1 = L8_1.get_mpattribute
      L9_1 = "LUA:PeFileVersion!0.0.0.0"
      L8_1 = L8_1(L9_1)
      if not L8_1 then
        L8_1 = mp
        L8_1 = L8_1.get_mpattribute
        L9_1 = "LUA:PeFileVersion!10.0.0.0"
        L8_1 = L8_1(L9_1)
        if not L8_1 then
          L8_1 = mp
          L8_1 = L8_1.get_mpattribute
          L9_1 = "LUA:PeFileVersion!4.8.4084.0"
          L8_1 = L8_1(L9_1)
          if not L8_1 then
            goto lbl_64
          end
        end
      end
    end
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  else
    ::lbl_64::
    L8_1 = #L7_1
    if L8_1 == 39 then
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L7_1
      L10_1 = "!app_web_"
      L11_1 = -21
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if L8_1 ~= nil then
        L8_1 = mp
        L8_1 = L8_1.CLEAN
        return L8_1
    end
    else
      L8_1 = #L7_1
      if L8_1 == 42 then
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = L7_1
        L10_1 = "!app_web_"
        L11_1 = -24
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if L8_1 ~= nil then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
      end
      else
        L8_1 = TT_SendBMSigTrigger
        L9_1 = L2_1
        L10_1 = "SuspModuleName"
        L11_1 = L7_1
        L12_1 = 2
        L8_1(L9_1, L10_1, L11_1, L12_1)
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
