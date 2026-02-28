local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L1_1 = L1_1(L2_1)
  if L1_1 == true then
    L1_1 = mp
    L1_1 = L1_1.GetMOTWHostUrl
    L1_1 = L1_1()
    L2_1 = isnull
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
    L2_1 = L1_1.find
    L3_1 = ".screenconnect.com/"
    L4_1 = 1
    L5_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 then
      L2_1 = L1_1.find
      L3_1 = "&y=guest&r="
      L4_1 = 1
      L5_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1)
      if L2_1 then
        L2_1 = L1_1.find
        L3_1 = "relay.screenconnect.com"
        L4_1 = 1
        L5_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1)
        if L2_1 then
          goto lbl_57
        end
      end
    end
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    do return L2_1 end
    ::lbl_57::
    L2_1 = mp
    L2_1 = L2_1.get_contextdata
    L3_1 = mp
    L3_1 = L3_1.CONTEXT_DATA_REFERRERURL
    L2_1 = L2_1(L3_1)
    L3_1 = isnull
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L3_1 = contains
    L4_1 = L2_1
    L5_1 = ".screenconnect.com"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
