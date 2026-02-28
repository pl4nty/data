local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SCRIPT:PowerShell"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "SCRIPT:WmicString"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "SCRIPT:BitsadminString"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "SCRIPT:MsWorkflowCompilerString"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.get_mpattribute
        L1_1 = "SCRIPT:MshtaString"
        L0_1 = L0_1(L1_1)
        if not L0_1 then
          L0_1 = mp
          L0_1 = L0_1.get_mpattribute
          L1_1 = "SCRIPT:CertutilString"
          L0_1 = L0_1(L1_1)
          if not L0_1 then
            L0_1 = mp
            L0_1 = L0_1.get_mpattribute
            L1_1 = "SCRIPT:CmstpString"
            L0_1 = L0_1(L1_1)
            if not L0_1 then
              L0_1 = mp
              L0_1 = L0_1.get_mpattribute
              L1_1 = "SCRIPT:CscString"
              L0_1 = L0_1(L1_1)
              if not L0_1 then
                L0_1 = mp
                L0_1 = L0_1.get_mpattribute
                L1_1 = "SCRIPT:CmdkeyString"
                L0_1 = L0_1(L1_1)
                if not L0_1 then
                  L0_1 = mp
                  L0_1 = L0_1.get_mpattribute
                  L1_1 = "SCRIPT:SchtasksString"
                  L0_1 = L0_1(L1_1)
                  if not L0_1 then
                    L0_1 = mp
                    L0_1 = L0_1.get_mpattribute
                    L1_1 = "SCRIPT:StringCmdExe"
                    L0_1 = L0_1(L1_1)
                    if not L0_1 then
                      L0_1 = mp
                      L0_1 = L0_1.CLEAN
                      return L0_1
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.len
  L1_1 = L1_1(L2_1)
  if 18 < L1_1 then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = -18
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == ".settingcontent-ms" then
      L1_1 = mp
      L1_1 = L1_1.get_contextdata
      L2_1 = mp
      L2_1 = L2_1.CONTEXT_DATA_SCANREASON
      L1_1 = L1_1(L2_1)
      L2_1 = {}
      L2_1["outlook.exe"] = ""
      L2_1["iexplore.exe"] = ""
      L2_1["browser_broker.exe"] = ""
      L2_1["firefox.exe"] = ""
      L2_1["chrome.exe"] = ""
      L2_1["winword.exe"] = ""
      L2_1["powerpnt.exe"] = ""
      L2_1["excel.exe"] = ""
      L2_1["acrord32.exe"] = ""
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = mp
      L4_1 = L4_1.get_contextdata
      L5_1 = mp
      L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
      L4_1, L5_1 = L4_1(L5_1)
      L3_1 = L3_1(L4_1, L5_1)
      L4_1 = L2_1[L3_1]
      if not L4_1 then
        L4_1 = isOutlookProcess
        L5_1 = L3_1
        L4_1 = L4_1(L5_1)
        if not L4_1 then
          goto lbl_131
        end
      end
      L4_1 = mp
      L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
      if L1_1 == L4_1 then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
      ::lbl_131::
      L4_1 = mp
      L4_1 = L4_1.get_contextdata
      L5_1 = mp
      L5_1 = L5_1.CONTEXT_DATA_HAS_MOTW_ADS
      L4_1 = L4_1(L5_1)
      if L4_1 == true then
        L4_1 = mp
        L4_1 = L4_1.SCANREASON_ONOPEN
        if L1_1 == L4_1 then
          L4_1 = mp
          L4_1 = L4_1.GetMOTWZone
          L4_1 = L4_1()
          if L4_1 == 3 or L4_1 == 4 then
            L5_1 = mp
            L5_1 = L5_1.INFECTED
            return L5_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
