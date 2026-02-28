local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:PS.Memset"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "SCRIPT:PS.Gt0x1000"
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.get_mpattribute
      L2_1 = "SCRIPT:PS.AddType"
      L1_1 = L1_1(L2_1)
      if L1_1 then
        L1_1 = mp
        L1_1 = L1_1.get_mpattribute
        L2_1 = "SCRIPT:PS.Calloc"
        L1_1 = L1_1(L2_1)
        if L1_1 then
          L1_1 = mp
          L1_1 = L1_1.get_mpattribute
          L2_1 = "SCRIPT:PS.CreateThread"
          L1_1 = L1_1(L2_1)
          if L1_1 then
            L1_1 = mp
            L1_1 = L1_1.set_mpattribute
            L2_1 = "MpDisableCaching"
            L1_1(L2_1)
            L1_1 = {}
            L2_1 = table
            L2_1 = L2_1.insert
            L3_1 = L1_1
            L4_1 = L0_1
            L2_1(L3_1, L4_1)
            L2_1 = MpCommon
            L2_1 = L2_1.SetPersistContextNoPath
            L3_1 = "Lua:MalPsSmsScanAmsi"
            L4_1 = L1_1
            L5_1 = 0
            L2_1(L3_1, L4_1, L5_1)
          end
        end
      end
      L1_1 = MpCommon
      L1_1 = L1_1.RequestSmsOnProcess
      L2_1 = L0_1
      L3_1 = MpCommon
      L3_1 = L3_1.SMS_SCAN_HIGH
      L1_1(L2_1, L3_1)
  end
  else
    L1_1 = MpCommon
    L1_1 = L1_1.RequestSmsOnProcess
    L2_1 = L0_1
    L3_1 = MpCommon
    L3_1 = L3_1.SMS_SCAN_MED
    L1_1(L2_1, L3_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
