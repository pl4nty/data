local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_HAS_MOTW_ADS
L0_1 = L0_1(L1_1)
if L0_1 ~= false then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_SCANREASON
  L0_1 = L0_1(L1_1)
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 == L1_1 then
    goto lbl_20
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_20::
L0_1 = mp
L0_1 = L0_1.GetMOTWZone
L0_1 = L0_1()
if L0_1 ~= nil and 3 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = ""
  end
  L3_1 = L1_1
  L2_1 = L1_1.lower
  L2_1 = L2_1(L3_1)
  if L2_1 == "outlook.exe" then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "Lua:SingleSuspiciousExtensionInZip"
    L2_1 = L2_1(L3_1)
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "Lua:RarHasFileWithExeExtension"
    L3_1 = L3_1(L4_1)
    L4_1 = mp
    L4_1 = L4_1.get_mpattribute
    L5_1 = "Lua:SingleSuspiciousExtensionIn7z"
    L4_1 = L4_1(L5_1)
    L5_1 = mp
    L5_1 = L5_1.get_mpattribute
    L6_1 = "Lua:SingleSuspiciousExtensionInACE"
    L5_1 = L5_1(L6_1)
    L6_1 = mp
    L6_1 = L6_1.getfilesize
    L6_1 = L6_1()
    if L6_1 <= 4194304 and (L2_1 or L3_1 or L4_1 or L5_1) then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = "MpForceScanArchives"
      L7_1(L8_1)
    end
    L7_1 = mp
    L7_1 = L7_1.getfilename
    L8_1 = mp
    L8_1 = L8_1.bitor
    L9_1 = mp
    L9_1 = L9_1.bitor
    L10_1 = mp
    L10_1 = L10_1.FILEPATH_QUERY_FNAME
    L11_1 = mp
    L11_1 = L11_1.FILEPATH_QUERY_PATH
    L9_1 = L9_1(L10_1, L11_1)
    L10_1 = mp
    L10_1 = L10_1.FILEPATH_QUERY_LOWERCASE
    L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L8_1(L9_1, L10_1)
    L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
    L10_1 = L8_1
    L9_1 = L8_1.sub
    L11_1 = -3
    L9_1 = L9_1(L10_1, L11_1)
    L11_1 = L8_1
    L10_1 = L8_1.sub
    L12_1 = -4
    L10_1 = L10_1(L11_1, L12_1)
    L12_1 = L8_1
    L11_1 = L8_1.sub
    L13_1 = -5
    L11_1 = L11_1(L12_1, L13_1)
    L12_1 = {}
    L12_1[".doc"] = true
    L12_1[".xls"] = true
    L12_1[".rtf"] = true
    L12_1[".docm"] = true
    L12_1[".xlsm"] = true
    L12_1[".ppam"] = true
    L12_1[".pptm"] = true
    L12_1[".ppsm"] = true
    L12_1[".potm"] = true
    L12_1[".jse"] = true
    L12_1[".vbs"] = true
    L12_1[".wsf"] = true
    L12_1[".vbe"] = true
    L12_1[".hta"] = true
    L12_1[".js"] = true
    L12_1[".mht"] = true
    L12_1[".lnk"] = true
    L12_1[".bat"] = true
    L12_1[".ps1"] = true
    L12_1[".zip"] = true
    L12_1[".rar"] = true
    L12_1[".7z"] = true
    L12_1[".iso"] = true
    L12_1[".arj"] = true
    L12_1[".gz"] = true
    L12_1[".ace"] = true
    L12_1[".exe"] = true
    L12_1[".scr"] = true
    L12_1[".pif"] = true
    L12_1[".jar"] = true
    L13_1 = L12_1[L9_1]
    if L13_1 ~= true then
      L13_1 = L12_1[L10_1]
      if L13_1 ~= true then
        L13_1 = L12_1[L11_1]
        if L13_1 ~= true then
          goto lbl_152
        end
      end
    end
    if L10_1 == ".doc" or L10_1 == ".xls" then
      L13_1 = mp
      L13_1 = L13_1.get_mpattribute
      L14_1 = "MHSTR:MacroInside"
      L13_1 = L13_1(L14_1)
      if true ~= L13_1 then
        L13_1 = mp
        L13_1 = L13_1.CLEAN
        return L13_1
      end
    end
    L13_1 = mp
    L13_1 = L13_1.LOWFI
    return L13_1
  end
end
::lbl_152::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
