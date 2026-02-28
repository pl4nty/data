local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L0_1 = L0_1(L1_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = ""
    end
    L1_1 = "Lua:MSIParent_"
    if L0_1 == "" then
      L2_1 = L1_1
      L3_1 = "Unknown"
      L1_1 = L2_1 .. L3_1
    else
      L2_1 = {}
      L2_1["nxtsvc.exe"] = true
      L2_1["receiver.exe"] = true
      L2_1["ndtrack.exe"] = true
      L2_1["adobearm.exe"] = true
      L2_1["applicationcollection.exe"] = true
      L2_1["dellsupportassistremedationservice.exe"] = true
      L2_1["monitoringhost.exe"] = true
      L4_1 = L0_1
      L3_1 = L0_1.lower
      L3_1 = L3_1(L4_1)
      L3_1 = L2_1[L3_1]
      if L3_1 ~= true then
        L4_1 = L1_1
        L5_1 = "NonMonitored"
        L1_1 = L4_1 .. L5_1
      end
    end
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = L1_1
    L2_1(L3_1)
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
