local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = pcall
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_AMSI_APPNAME
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  L3_1 = pcall
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_AMSI_OPERATION_PPID
  L3_1, L4_1 = L3_1(L4_1, L5_1)
  if L1_1 == nil or L3_1 == nil or L4_1 == nil or L2_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = pcall
  L6_1 = mp
  L6_1 = L6_1.get_contextdata
  L7_1 = mp
  L7_1 = L7_1.CONTEXT_DATA_AMSI_CONTENTNAME
  L5_1, L6_1 = L5_1(L6_1, L7_1)
  if L5_1 and L6_1 ~= nil then
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    L8_1 = string
    L8_1 = L8_1.find
    L9_1 = L7_1
    L10_1 = "migration.ps1"
    L8_1 = L8_1(L9_1, L10_1)
    if not L8_1 then
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L7_1
      L10_1 = "nettcpip.psd1"
      L8_1 = L8_1(L9_1, L10_1)
      if not L8_1 then
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = L7_1
        L10_1 = "scheduledtasks.psd1"
        L8_1 = L8_1(L9_1, L10_1)
        if not L8_1 then
          goto lbl_76
        end
      end
    end
    L8_1 = TrackPidAndTechnique
    L9_1 = L4_1
    L10_1 = "ttexclusion"
    L11_1 = "ttexclusion-mitretel"
    L8_1(L9_1, L10_1, L11_1)
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
::lbl_76::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
