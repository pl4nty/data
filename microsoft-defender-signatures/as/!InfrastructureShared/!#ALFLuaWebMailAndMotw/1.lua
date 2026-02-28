local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.IOAVGetDownloadUrl
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "_task=mail&_action=get&_mbox=inbox"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:WebMailDownload"
    L1_1(L2_1)
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "Lua:SingleSuspiciousExtensionInZip"
    L1_1 = L1_1(L2_1)
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "Lua:RarHasFileWithExeExtension"
    L2_1 = L2_1(L3_1)
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "Lua:SingleSuspiciousExtensionIn7z"
    L3_1 = L3_1(L4_1)
    L4_1 = mp
    L4_1 = L4_1.get_mpattribute
    L5_1 = "Lua:SingleSuspiciousExtensionInACE"
    L4_1 = L4_1(L5_1)
    L5_1 = mp
    L5_1 = L5_1.getfilesize
    L5_1 = L5_1()
    if L5_1 <= 4194304 and (L1_1 or L2_1 or L3_1 or L4_1) then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "MpForceScanArchives"
      L6_1(L7_1)
    end
    L6_1 = mp
    L6_1 = L6_1.getfilename
    L7_1 = mp
    L7_1 = L7_1.bitor
    L8_1 = mp
    L8_1 = L8_1.FILEPATH_QUERY_FNAME
    L9_1 = mp
    L9_1 = L9_1.FILEPATH_QUERY_LOWERCASE
    L7_1, L8_1, L9_1, L10_1, L11_1 = L7_1(L8_1, L9_1)
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
    L8_1 = L6_1
    L7_1 = L6_1.sub
    L9_1 = -3
    L7_1 = L7_1(L8_1, L9_1)
    L9_1 = L6_1
    L8_1 = L6_1.sub
    L10_1 = -4
    L8_1 = L8_1(L9_1, L10_1)
    L10_1 = L6_1
    L9_1 = L6_1.sub
    L11_1 = -5
    L9_1 = L9_1(L10_1, L11_1)
    L10_1 = {}
    L10_1[".doc"] = true
    L10_1[".xls"] = true
    L10_1[".rtf"] = true
    L10_1[".docm"] = true
    L10_1[".xlsm"] = true
    L10_1[".ppam"] = true
    L10_1[".pptm"] = true
    L10_1[".ppsm"] = true
    L10_1[".potm"] = true
    L10_1[".xlsx"] = true
    L10_1[".docx"] = true
    L10_1[".jse"] = true
    L10_1[".vbs"] = true
    L10_1[".wsf"] = true
    L10_1[".vbe"] = true
    L10_1[".hta"] = true
    L10_1[".js"] = true
    L10_1[".mht"] = true
    L10_1[".lnk"] = true
    L10_1[".bat"] = true
    L10_1[".ps1"] = true
    L10_1[".zip"] = true
    L10_1[".rar"] = true
    L10_1[".7z"] = true
    L10_1[".iso"] = true
    L10_1[".arj"] = true
    L10_1[".gz"] = true
    L10_1[".ace"] = true
    L10_1[".xz"] = true
    L10_1[".bz"] = true
    L10_1[".r00"] = true
    L10_1[".rev"] = true
    L10_1[".exe"] = true
    L10_1[".scr"] = true
    L10_1[".pif"] = true
    L10_1[".jar"] = true
    L11_1 = L10_1[L7_1]
    if L11_1 ~= true then
      L11_1 = L10_1[L8_1]
      if L11_1 ~= true then
        L11_1 = L10_1[L9_1]
        if L11_1 ~= true then
          goto lbl_123
        end
      end
    end
    L11_1 = mp
    L11_1 = L11_1.INFECTED
    return L11_1
  end
end
::lbl_123::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
