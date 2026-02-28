local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
L0_1 = L0_1.get_mpattribute
L1_1 = "RPF:TopLevelFile"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:FileInZip"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Lua:FileIn7z"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "Lua:FileInRar"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.CLEAN
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Nscript:Type_js"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Nscript:Type_vbs"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Nscript:Type_ps"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "Lua:JSExt"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.get_mpattribute
        L1_1 = "Lua:VBSExt"
        L0_1 = L0_1(L1_1)
        if not L0_1 then
          L0_1 = mp
          L0_1 = L0_1.get_mpattribute
          L1_1 = "Lua:PS1Ext"
          L0_1 = L0_1(L1_1)
          if not L0_1 then
            L0_1 = mp
            L0_1 = L0_1.get_mpattribute
            L1_1 = "LUA:WSFExt"
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
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILENAME
L0_1 = L0_1(L1_1)
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
L1_1 = false
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "(%.[^%.]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == ".psd1" or L2_1 == ".psm1" or L2_1 == ".ps1xml" or L2_1 == ".psrc" or L2_1 == ".pssc" or L2_1 == ".cdxml" or L2_1 == ".testpasses" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L2_1 == ".ps1" then
  L1_1 = true
end
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "RPF:ObfusJsVbs:Probability"
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_mpattributevalue
L4_1 = "RPF:ObfusJsVbs:Probability"
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L3_1 < 75 or 100 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = false
L5_1 = false
L6_1 = false
L7_1 = mp
L7_1 = L7_1.get_contextdata
L8_1 = mp
L8_1 = L8_1.CONTEXT_DATA_HAS_MOTW_ADS
L7_1 = L7_1(L8_1)
if L7_1 == true then
  L7_1 = mp
  L7_1 = L7_1.GetMOTWZone
  L7_1 = L7_1()
  if L7_1 == 3 then
    L4_1 = true
  end
end
L7_1 = mp
L7_1 = L7_1.get_mpattribute
L8_1 = "Lua:FileInZip"
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = mp
  L7_1 = L7_1.get_mpattribute
  L8_1 = "Lua:FileIn7z"
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    L7_1 = mp
    L7_1 = L7_1.get_mpattribute
    L8_1 = "Lua:FileInRar"
    L7_1 = L7_1(L8_1)
    if not L7_1 then
      goto lbl_195
    end
  end
end
L5_1 = true
L7_1 = mp
L7_1 = L7_1.UfsGetMetadataBool
L8_1 = "Lua:ZipWithMotwAll"
L9_1 = true
L7_1, L8_1 = L7_1(L8_1, L9_1)
if L7_1 == 0 and L8_1 ~= nil then
  L6_1 = true
end
::lbl_195::
L7_1 = false
if L1_1 == false then
  if L6_1 == true and 85 <= L3_1 then
    L7_1 = true
  end
  if L5_1 == true and 90 <= L3_1 then
    L7_1 = true
  end
  if L4_1 == true and 95 <= L3_1 then
    L7_1 = true
  end
  if 99 <= L3_1 then
    L7_1 = true
  end
else
  if L6_1 == true and 75 <= L3_1 then
    L7_1 = true
  end
  if L5_1 == true and 80 <= L3_1 then
    L7_1 = true
  end
  if L4_1 == true and 85 <= L3_1 then
    L7_1 = true
  end
  if 90 <= L3_1 then
    L7_1 = true
  end
end
if L7_1 == false then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.IsTrustedFile
L9_1 = false
L8_1, L9_1 = L8_1(L9_1)
if L8_1 == true then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = mp
L10_1 = L10_1.getfilename
L11_1 = mp
L11_1 = L11_1.FILEPATH_QUERY_FULL
L10_1 = L10_1(L11_1)
if L10_1 == nil or L10_1 == "" then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = MpCommon
L11_1 = L11_1.PathToWin32Path
L12_1 = L10_1
L11_1 = L11_1(L12_1)
L10_1 = L11_1
if L10_1 == nil or L10_1 == "" then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = string
L11_1 = L11_1.lower
L12_1 = L10_1
L11_1 = L11_1(L12_1)
L10_1 = L11_1
L11_1 = mp
L11_1 = L11_1.IsPathExcludedForHipsRule
L12_1 = L10_1
L13_1 = "5beb7efe-fd9a-4556-801d-275e5ffc04cc"
L11_1 = L11_1(L12_1, L13_1)
if L11_1 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = mp
L11_1 = L11_1.set_mpattribute
L12_1 = "MpDisableCaching"
L11_1(L12_1)
L11_1 = mp
L11_1 = L11_1.get_contextdata
L12_1 = mp
L12_1 = L12_1.CONTEXT_DATA_SCANREASON
L11_1 = L11_1(L12_1)
L12_1 = mp
L12_1 = L12_1.SCANREASON_ONOPEN
if L11_1 == L12_1 then
  L11_1 = string
  L11_1 = L11_1.find
  L12_1 = L10_1
  L13_1 = ">%[msilres"
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 then
    L11_1 = mp
    L11_1 = L11_1.set_mpattribute
    L12_1 = "LUA:InsideMSILRES"
    L11_1(L12_1)
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
  L11_1 = mp
  L11_1 = L11_1.get_contextdata
  L12_1 = mp
  L12_1 = L12_1.CONTEXT_DATA_PROCESSNAME
  L11_1 = L11_1(L12_1)
  if L11_1 == nil or L11_1 == "" then
    L12_1 = mp
    L12_1 = L12_1.CLEAN
    return L12_1
  end
  L12_1 = string
  L12_1 = L12_1.lower
  L13_1 = L11_1
  L12_1 = L12_1(L13_1)
  L11_1 = L12_1
  L12_1 = {}
  L12_1["cscript.exe"] = true
  L12_1["wscript.exe"] = true
  L12_1["winword.exe"] = true
  L12_1["powerpnt.exe"] = true
  L12_1["excel.exe"] = true
  L12_1["powershell.exe"] = true
  L13_1 = L12_1[L11_1]
  if L13_1 == true then
    if L11_1 == "powershell.exe" then
      if L1_1 then
        L13_1 = mp
        L13_1 = L13_1.INFECTED
        return L13_1
      end
    else
      L13_1 = mp
      L13_1 = L13_1.INFECTED
      return L13_1
    end
  end
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
