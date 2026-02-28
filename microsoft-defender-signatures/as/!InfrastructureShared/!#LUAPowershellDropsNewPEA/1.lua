local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
    L0_1 = L0_1.getfilename
    L1_1 = mp
    L1_1 = L1_1.bitor
    L2_1 = mp
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_FNAME
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_PATH
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
    L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L1_1(L2_1, L3_1)
    L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
    if L1_1 ~= nil then
      L3_1 = L1_1
      L2_1 = L1_1.sub
      L4_1 = -4
      L2_1 = L2_1(L3_1, L4_1)
      if ".exe" == L2_1 then
        L2_1 = mp
        L2_1 = L2_1.get_contextdata
        L3_1 = mp
        L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
        L2_1 = L2_1(L3_1)
        L3_1 = L2_1
        L2_1 = L2_1.lower
        L2_1 = L2_1(L3_1)
        if "powershell.exe" == L2_1 then
          L3_1 = L0_1
          L2_1 = L0_1.find
          L4_1 = "\\appdata\\"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if nil ~= L2_1 then
            L2_1 = mp
            L2_1 = L2_1.set_mpattribute
            L3_1 = "LUA:PowershellDropsNewPEInAppDataPath.A"
            L2_1(L3_1)
          end
          L2_1 = IsChainNPath
          L3_1 = L0_1
          L2_1 = L2_1(L3_1)
          if false == L2_1 then
            L2_1 = MpCommon
            L2_1 = L2_1.QueryPersistContextNoPath
            L3_1 = "CLF_AM"
            L4_1 = "OfcUsrTruDocRec"
            L2_1 = L2_1(L3_1, L4_1)
            if L2_1 then
              L2_1 = mp
              L2_1 = L2_1.set_mpattribute
              L3_1 = "Lua:OfcUsrTruDocRecPsNewPeDrop"
              L2_1(L3_1)
            end
            L2_1 = false
            L3_1 = MpCommon
            L3_1 = L3_1.QueryPersistContextNoPath
            L4_1 = "CLF_AM"
            L5_1 = "CLF_AM_EC"
            L3_1 = L3_1(L4_1, L5_1)
            if L3_1 then
              L3_1 = mp
              L3_1 = L3_1.set_mpattribute
              L4_1 = "Lua:EmailClientChainPsNewPeDrop"
              L3_1(L4_1)
              L2_1 = true
            end
            L3_1 = MpCommon
            L3_1 = L3_1.QueryPersistContextNoPath
            L4_1 = "CLF_AM"
            L5_1 = "CLF_AM_WM"
            L3_1 = L3_1(L4_1, L5_1)
            if L3_1 then
              L3_1 = mp
              L3_1 = L3_1.set_mpattribute
              L4_1 = "Lua:WebMailChainPsNewPeDrop"
              L3_1(L4_1)
              L2_1 = true
            end
            if L2_1 then
              L3_1 = MpCommon
              L3_1 = L3_1.GetPersistContextNoPath
              L4_1 = "CLF_IC"
              L3_1 = L3_1(L4_1)
              L4_1 = ipairs
              L5_1 = L3_1
              L4_1, L5_1, L6_1 = L4_1(L5_1)
              for L7_1, L8_1 in L4_1, L5_1, L6_1 do
                L9_1 = mp
                L9_1 = L9_1.ReportLowfi
                L10_1 = L8_1
                L11_1 = 1933116662
                L9_1(L10_1, L11_1)
              end
            end
            L3_1 = mp
            L3_1 = L3_1.INFECTED
            return L3_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
