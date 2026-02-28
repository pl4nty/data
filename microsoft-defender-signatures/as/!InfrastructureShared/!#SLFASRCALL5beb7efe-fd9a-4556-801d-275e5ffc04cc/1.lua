local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "5beb7efe-fd9a-4556-801d-275e5ffc04cc"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "RPF:TopLevelFile"
L1_1 = L1_1(L2_1)
if L1_1 == false then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\appdata\\local\\temp\\"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = false
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "SCPT:ObfuscatedScriptAsrTestSample"
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "SCPT:PS:ReflectiveInject"
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "AsrMatch5beb7efe"
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.get_mpattribute
      L3_1 = "ALF:Script/ObfusSingleJsInZipMsit.B"
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        L2_1 = mp
        L2_1 = L2_1.get_mpattribute
        L3_1 = "ALF:Script/ObfusSingleJsInZipMsit.A"
        L2_1 = L2_1(L3_1)
        if not L2_1 then
          L2_1 = mp
          L2_1 = L2_1.get_mpattribute
          L3_1 = "SLF:Script/VbsInMotw.B"
          L2_1 = L2_1(L3_1)
          if not L2_1 then
            L2_1 = mp
            L2_1 = L2_1.get_mpattribute
            L3_1 = "SLF:Script/VbsInMotw.A"
            L2_1 = L2_1(L3_1)
            if not L2_1 then
              L2_1 = mp
              L2_1 = L2_1.get_mpattribute
              L3_1 = "SLF:Script/JsInMotw.B"
              L2_1 = L2_1(L3_1)
              if not L2_1 then
                L2_1 = mp
                L2_1 = L2_1.get_mpattribute
                L3_1 = "SLF:Script/JsInMotw.A"
                L2_1 = L2_1(L3_1)
                if not L2_1 then
                  goto lbl_119
                end
              end
            end
          end
        end
      end
      L2_1 = mp
      L2_1 = L2_1.get_mpattribute
      L3_1 = "Lua:MsitOrg"
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        goto lbl_119
      end
    end
  end
end
L1_1 = true
::lbl_119::
L2_1 = false
L3_1 = false
if L1_1 == false then
  L4_1 = mp
  L4_1 = L4_1.get_mpattribute
  L5_1 = "Nscript:Type_js"
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.get_mpattribute
    L5_1 = "Nscript:Type_vbs"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattribute
      L5_1 = "Nscript:Type_ps"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        L4_1 = mp
        L4_1 = L4_1.get_mpattribute
        L5_1 = "Lua:JSExt"
        L4_1 = L4_1(L5_1)
        if not L4_1 then
          L4_1 = mp
          L4_1 = L4_1.get_mpattribute
          L5_1 = "Lua:VBSExt"
          L4_1 = L4_1(L5_1)
          if not L4_1 then
            L4_1 = mp
            L4_1 = L4_1.get_mpattribute
            L5_1 = "Lua:PS1Ext"
            L4_1 = L4_1(L5_1)
            if not L4_1 then
              L4_1 = mp
              L4_1 = L4_1.get_mpattribute
              L5_1 = "LUA:WSFExt"
              L4_1 = L4_1(L5_1)
              if not L4_1 then
                L4_1 = mp
                L4_1 = L4_1.CLEAN
                return L4_1
              end
            end
          end
        end
      end
    end
  end
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_FILENAME
  L4_1 = L4_1(L5_1)
  if L4_1 == nil or L4_1 == "" then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
  L5_1 = string
  L5_1 = L5_1.match
  L6_1 = L4_1
  L7_1 = "(%.[^%.]+)$"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 == ".psd1" or L5_1 == ".psm1" or L5_1 == ".ps1xml" or L5_1 == ".psrc" or L5_1 == ".pssc" or L5_1 == ".cdxml" or L5_1 == ".testpasses" then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  if L5_1 == ".ps1" then
    L2_1 = true
  end
  L6_1 = mp
  L6_1 = L6_1.get_contextdata
  L7_1 = mp
  L7_1 = L7_1.CONTEXT_DATA_HAS_MOTW_ADS
  L6_1 = L6_1(L7_1)
  if L6_1 == true then
    L6_1 = mp
    L6_1 = L6_1.GetMOTWZone
    L6_1 = L6_1()
    if L6_1 == 3 then
      L3_1 = true
    end
  end
  L6_1 = mp
  L6_1 = L6_1.get_mpattribute
  L7_1 = "RPF:TobeetJs:Probability"
  L6_1 = L6_1(L7_1)
  if not L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = mp
  L6_1 = L6_1.get_mpattributevalue
  L7_1 = "RPF:TobeetJs:Probability"
  L6_1 = L6_1(L7_1)
  if L6_1 ~= nil then
    if L2_1 == false and L3_1 == false and 95 <= L6_1 then
      L1_1 = true
    end
    if L2_1 == false and L3_1 == true and 90 <= L6_1 then
      L1_1 = true
    end
    if L2_1 == true and L3_1 == false and 99 <= L6_1 then
      L1_1 = true
    end
    if L2_1 == true and L3_1 == true and 95 <= L6_1 then
      L1_1 = true
    end
  end
end
if L1_1 == false then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.IsTrustedFile
L5_1 = false
L4_1, L5_1 = L4_1(L5_1)
if L4_1 == true then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.IsPathExcludedForHipsRule
L7_1 = L0_1
L8_1 = "5beb7efe-fd9a-4556-801d-275e5ffc04cc"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.find
L7_1 = L0_1
L8_1 = "\\appdata\\roaming\\microsoft\\office\\16.0\\[^\\]+\\proofing\\"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
else
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L0_1
  L8_1 = "\\appdata\\roaming\\microsoft\\office\\recent\\index.dat"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  else
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L0_1
    L8_1 = "\\program files[^\\]*\\microsoft office\\root\\office%d+\\"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    else
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L0_1
      L8_1 = "\\windows\\imecache\\[^\\]+\\appdeploytoolkit\\appdeploytoolkitmain.cs"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      else
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L0_1
        L8_1 = "\\windows\\ccmcache\\[^\\]+\\appdeploytoolkit\\appdeploytoolkitmain.cs"
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 then
          L6_1 = mp
          L6_1 = L6_1.CLEAN
          return L6_1
        else
          L6_1 = string
          L6_1 = L6_1.find
          L7_1 = L0_1
          L8_1 = "\\windowspowershell\\v1.0\\modules\\"
          L9_1 = 1
          L10_1 = true
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if L6_1 then
            L6_1 = mp
            L6_1 = L6_1.CLEAN
            return L6_1
          else
            L6_1 = string
            L6_1 = L6_1.find
            L7_1 = L0_1
            L8_1 = "\\eceagentservice\\[^\\]+\\[^\\]+%.psd1$"
            L6_1 = L6_1(L7_1, L8_1)
            if L6_1 then
              L6_1 = mp
              L6_1 = L6_1.CLEAN
              return L6_1
            else
              L6_1 = string
              L6_1 = L6_1.find
              L7_1 = L0_1
              L8_1 = "\\tanium\\tanium client\\tools\\endusernotifications\\"
              L9_1 = 1
              L10_1 = true
              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
              if L6_1 then
                L6_1 = mp
                L6_1 = L6_1.CLEAN
                return L6_1
              else
                L6_1 = string
                L6_1 = L6_1.find
                L7_1 = L0_1
                L8_1 = "\\tanium\\tanium client\\tools\\enforce\\"
                L9_1 = 1
                L10_1 = true
                L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                if L6_1 then
                  L6_1 = mp
                  L6_1 = L6_1.CLEAN
                  return L6_1
                else
                  L6_1 = string
                  L6_1 = L6_1.find
                  L7_1 = L0_1
                  L8_1 = "\\tanium\\tanium client\\downloads\\action_[^\\]+\\[^\\]+%.vbs$"
                  L6_1 = L6_1(L7_1, L8_1)
                  if L6_1 then
                    L6_1 = mp
                    L6_1 = L6_1.CLEAN
                    return L6_1
                  else
                    L6_1 = string
                    L6_1 = L6_1.find
                    L7_1 = L0_1
                    L8_1 = "\\sar\\rules\\[^\\]+\\rulefiles\\lib\\[^\\]+%.vbs$"
                    L6_1 = L6_1(L7_1, L8_1)
                    if L6_1 then
                      L6_1 = mp
                      L6_1 = L6_1.CLEAN
                      return L6_1
                    else
                      L6_1 = versioning
                      L6_1 = L6_1.GetOrgID
                      L6_1 = L6_1()
                      if L6_1 ~= nil and L6_1 ~= "" then
                        L7_1 = string
                        L7_1 = L7_1.lower
                        L8_1 = L6_1
                        L7_1 = L7_1(L8_1)
                        L6_1 = L7_1
                        if L6_1 == "cd568033-6cdd-4daf-9263-45f282f27ae9" or L6_1 == "ccf4632d-a216-4a0a-88ec-332cacb9ccfc" or L6_1 == "84de09f9-73cb-4ba3-9eb5-c44b04ecaefd" then
                          L7_1 = string
                          L7_1 = L7_1.find
                          L8_1 = L0_1
                          L9_1 = "\\appdata\\local\\temp\\mxescr%d+%.vbs$"
                          L7_1 = L7_1(L8_1, L9_1)
                          if L7_1 then
                            L7_1 = mp
                            L7_1 = L7_1.CLEAN
                            return L7_1
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
    end
  end
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "MpDisableCaching"
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_SCANREASON
L6_1 = L6_1(L7_1)
L7_1 = mp
L7_1 = L7_1.SCANREASON_ONOPEN
if L6_1 == L7_1 then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L0_1
  L8_1 = ">%[msilres"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "LUA:InsideMSILRES"
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = mp
  L6_1 = L6_1.get_mpattribute
  L7_1 = "LUA:InsideMSILRES"
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = mp
  L6_1 = L6_1.get_contextdata
  L7_1 = mp
  L7_1 = L7_1.CONTEXT_DATA_PROCESSNAME
  L6_1 = L6_1(L7_1)
  if L6_1 == nil or L6_1 == "" then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L6_1 = L7_1
  L7_1 = {}
  L7_1["cscript.exe"] = true
  L7_1["wscript.exe"] = true
  L7_1["winword.exe"] = true
  L7_1["powerpnt.exe"] = true
  L7_1["excel.exe"] = true
  L7_1["powershell.exe"] = true
  L8_1 = L7_1[L6_1]
  if L8_1 == true then
    if L6_1 == "powershell.exe" then
      if L2_1 then
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    else
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
