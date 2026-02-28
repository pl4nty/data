local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
    L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = "\\TfsStore\\Tfs_DAV"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = mp
      L4_1 = L4_1.get_contextdata
      L5_1 = mp
      L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
      L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
      if L3_1 == "svchost.exe" then
        L4_1 = MpCommon
        L4_1 = L4_1.QueryPersistContext
        L5_1 = L2_1
        L6_1 = "DroppedFromWebDav"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          L5_1 = MpCommon
          L5_1 = L5_1.AppendPersistContext
          L6_1 = L2_1
          L7_1 = "DroppedFromWebDav"
          L8_1 = 0
          L5_1(L6_1, L7_1, L8_1)
        end
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
