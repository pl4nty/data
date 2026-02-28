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
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.bitor
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_FNAME
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_PATH
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
    L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1)
    L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = "\\msft%.azure%.azure%-backup.-\\powershell%-module"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = "\\msft%.sme%.azure%-center.-\\powershell%-module"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "\\sigma\\.+%.yml"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          goto lbl_54
        end
      end
    end
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:AlterigoExclusion"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    do return L3_1 end
    ::lbl_54::
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
