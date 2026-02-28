local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L1_2 = mp
  L1_2 = L1_2.readprotection
  L2_2 = false
  L1_2(L2_2)
  L1_2 = mp
  L1_2 = L1_2.readfile
  L2_2 = 32768
  L3_2 = 16
  L1_2 = L1_2(L2_2, L3_2)
  L3_2 = L1_2
  L2_2 = L1_2.find
  L4_2 = "\001CD001\001"
  L5_2 = 1
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if L2_2 ~= 1 then
    L2_2 = mp
    L2_2 = L2_2.CLEAN
    return L2_2
  end
  L2_2 = mp
  L2_2 = L2_2.readu_u32
  L3_2 = mp
  L3_2 = L3_2.readfile
  L4_2 = 32926
  L5_2 = 4
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = 1
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L2_2 * 2048
  L4_2 = A0_2 - 4
  if L3_2 > L4_2 then
    L4_2 = mp
    L4_2 = L4_2.CLEAN
    return L4_2
  end
  L4_2 = mp
  L4_2 = L4_2.readfile
  L5_2 = L3_2
  L6_2 = 4
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = string
  L5_2 = L5_2.byte
  L6_2 = L4_2
  L7_2 = 1
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L3_2 + L5_2
  L7_2 = A0_2 - 4
  if L6_2 > L7_2 then
    L6_2 = mp
    L6_2 = L6_2.CLEAN
    return L6_2
  end
  L6_2 = mp
  L6_2 = L6_2.readfile
  L7_2 = L3_2 + L5_2
  L8_2 = 4
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = string
  L7_2 = L7_2.byte
  L8_2 = L6_2
  L9_2 = 1
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = L3_2 + L5_2
  L8_2 = L8_2 + L7_2
  L9_2 = A0_2 - 4
  if L8_2 > L9_2 then
    L8_2 = mp
    L8_2 = L8_2.CLEAN
    return L8_2
  end
  L8_2 = mp
  L8_2 = L8_2.readfile
  L9_2 = L3_2 + L5_2
  L9_2 = L9_2 + L7_2
  L10_2 = 4
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = string
  L9_2 = L9_2.byte
  L10_2 = L8_2
  L11_2 = 1
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = L3_2 + L5_2
  L10_2 = L10_2 + L7_2
  L10_2 = L10_2 + L9_2
  L11_2 = A0_2 - 4
  if L10_2 > L11_2 then
    L10_2 = mp
    L10_2 = L10_2.CLEAN
    return L10_2
  end
  L10_2 = mp
  L10_2 = L10_2.readfile
  L11_2 = L3_2 + L5_2
  L11_2 = L11_2 + L7_2
  L11_2 = L11_2 + L9_2
  L12_2 = 4
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = string
  L11_2 = L11_2.byte
  L12_2 = L10_2
  L13_2 = 1
  L11_2 = L11_2(L12_2, L13_2)
  if L11_2 ~= 0 then
    L12_2 = mp
    L12_2 = L12_2.CLEAN
    return L12_2
  end
  L12_2 = L9_2 * 2048
  L13_2 = A0_2 - 4
  if L12_2 > L13_2 then
    L13_2 = mp
    L13_2 = L13_2.CLEAN
    return L13_2
  end
  L13_2 = mp
  L13_2 = L13_2.readfile
  L14_2 = L12_2
  L15_2 = 4
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = string
  L14_2 = L14_2.byte
  L15_2 = L13_2
  L16_2 = 1
  L14_2 = L14_2(L15_2, L16_2)
  if L14_2 == 34 then
    L15_2 = mp
    L15_2 = L15_2.CLEAN
    return L15_2
  end
  L15_2 = L12_2 + L14_2
  L16_2 = A0_2 - 4
  if L15_2 > L16_2 then
    L15_2 = mp
    L15_2 = L15_2.CLEAN
    return L15_2
  end
  L15_2 = mp
  L15_2 = L15_2.readfile
  L16_2 = L12_2 + L14_2
  L17_2 = 4
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = string
  L16_2 = L16_2.byte
  L17_2 = L15_2
  L18_2 = 1
  L16_2 = L16_2(L17_2, L18_2)
  if L14_2 == L16_2 then
    L17_2 = mp
    L17_2 = L17_2.CLEAN
    return L17_2
  end
  L17_2 = L3_2 + L5_2
  L17_2 = L17_2 + L7_2
  L17_2 = L17_2 + 32
  L18_2 = A0_2 - 4
  if L17_2 > L18_2 then
    L17_2 = mp
    L17_2 = L17_2.CLEAN
    return L17_2
  end
  L17_2 = mp
  L17_2 = L17_2.readfile
  L18_2 = L3_2 + L5_2
  L18_2 = L18_2 + L7_2
  L18_2 = L18_2 + 32
  L19_2 = 4
  L17_2 = L17_2(L18_2, L19_2)
  L18_2 = string
  L18_2 = L18_2.byte
  L19_2 = L17_2
  L20_2 = 1
  L18_2 = L18_2(L19_2, L20_2)
  if L18_2 < 3 or 255 < L18_2 then
    L19_2 = mp
    L19_2 = L19_2.CLEAN
    return L19_2
  end
  L19_2 = L3_2 + L5_2
  L19_2 = L19_2 + L7_2
  L19_2 = L19_2 + 33
  if A0_2 < L19_2 then
    L19_2 = mp
    L19_2 = L19_2.CLEAN
    return L19_2
  end
  L19_2 = mp
  L19_2 = L19_2.readfile
  L20_2 = L3_2 + L5_2
  L20_2 = L20_2 + L7_2
  L20_2 = L20_2 + 33
  L21_2 = L18_2
  L19_2 = L19_2(L20_2, L21_2)
  L20_2 = string
  L20_2 = L20_2.gsub
  L21_2 = L19_2
  L22_2 = ";1"
  L23_2 = ""
  L24_2 = 1
  L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2)
  L19_2 = L20_2
  L20_2 = ""
  L21_2 = ""
  if 4 < L18_2 then
    L22_2 = string
    L22_2 = L22_2.lower
    L23_2 = string
    L23_2 = L23_2.sub
    L24_2 = L19_2
    L25_2 = -4
    L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L23_2(L24_2, L25_2)
    L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    L20_2 = L22_2
  end
  if 3 < L18_2 then
    L22_2 = string
    L22_2 = L22_2.lower
    L23_2 = string
    L23_2 = L23_2.sub
    L24_2 = L19_2
    L25_2 = -3
    L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L23_2(L24_2, L25_2)
    L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    L21_2 = L22_2
  end
  L22_2 = {}
  L22_2[".vbs"] = "VBS"
  L22_2[".lnk"] = "LNK"
  L22_2[".wsf"] = "WSF"
  L22_2[".vbe"] = "VBE"
  L22_2[".jse"] = "JSE"
  L22_2[".hta"] = "HTA"
  L22_2[".exe"] = "EXE"
  L22_2[".dll"] = "DLL"
  L22_2[".com"] = "COM"
  L22_2[".scr"] = "SCR"
  L22_2[".pif"] = "PIF"
  L22_2[".ps1"] = "PS"
  L22_2[".bat"] = "BAT"
  L22_2[".js"] = "JS"
  L23_2 = L22_2[L20_2]
  L24_2 = L22_2[L21_2]
  L25_2 = {}
  L25_2[".zip"] = "ZIP"
  L25_2[".rar"] = "RAR"
  L25_2[".ace"] = "ACE"
  L25_2[".iso"] = "ISO"
  L25_2[".arj"] = "ARJ"
  L25_2[".7z"] = "7Z"
  L25_2[".gz"] = "GZIP"
  L26_2 = L25_2[L20_2]
  L27_2 = L25_2[L21_2]
  if L23_2 ~= nil then
    L28_2 = mp
    L28_2 = L28_2.set_mpattribute
    L29_2 = "Lua:SingleExecExtensionInISOFromEmail"
    L28_2(L29_2)
    L28_2 = mp
    L28_2 = L28_2.set_mpattribute
    L29_2 = "Lua:Single"
    L30_2 = L23_2
    L31_2 = "InISOFromEmail"
    L29_2 = L29_2 .. L30_2 .. L31_2
    L28_2(L29_2)
  elseif L24_2 ~= nil then
    L28_2 = mp
    L28_2 = L28_2.set_mpattribute
    L29_2 = "Lua:SingleExecExtensionInISOFromEmail"
    L28_2(L29_2)
    L28_2 = mp
    L28_2 = L28_2.set_mpattribute
    L29_2 = "Lua:Single"
    L30_2 = L24_2
    L31_2 = "InISOFromEmail"
    L29_2 = L29_2 .. L30_2 .. L31_2
    L28_2(L29_2)
  elseif L26_2 ~= nil then
    L28_2 = mp
    L28_2 = L28_2.set_mpattribute
    L29_2 = "Lua:SingleArchiveExtensionInISOFromEmail"
    L28_2(L29_2)
    L28_2 = mp
    L28_2 = L28_2.set_mpattribute
    L29_2 = "Lua:Single"
    L30_2 = L26_2
    L31_2 = "InISOFromEmail"
    L29_2 = L29_2 .. L30_2 .. L31_2
    L28_2(L29_2)
  elseif L27_2 ~= nil then
    L28_2 = mp
    L28_2 = L28_2.set_mpattribute
    L29_2 = "Lua:SingleArchiveExtensionInISOFromEmail"
    L28_2(L29_2)
    L28_2 = mp
    L28_2 = L28_2.set_mpattribute
    L29_2 = "Lua:Single"
    L30_2 = L27_2
    L31_2 = "InISOFromEmail"
    L29_2 = L29_2 .. L30_2 .. L31_2
    L28_2(L29_2)
  end
end

ParseISOHeader = L0_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:ISOExt"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:ISOFileFound"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Lua:LNKinISOFound"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "BM_ISO_FILE"
      L0_1 = L0_1(L1_1)
    end
  end
end
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
L5_1 = L5_1.get_mpattribute
L6_1 = "BM_PDF_FILE"
L5_1 = L5_1(L6_1)
L6_1 = mp
L6_1 = L6_1.get_mpattribute
L7_1 = "Lua:JARExt"
L6_1 = L6_1(L7_1)
L7_1 = mp
L7_1 = L7_1.get_mpattribute
L8_1 = "MHSTR:MacroInside"
L7_1 = L7_1(L8_1)
L8_1 = mp
L8_1 = L8_1.getfilesize
L8_1 = L8_1()
if L8_1 <= 4194304 and (L1_1 or L2_1 or L3_1 or L4_1) or L8_1 <= 2097152 and L0_1 or 307200 <= L8_1 and L8_1 <= 1048576 and L6_1 or L8_1 <= 820000 and L5_1 or L7_1 then
  L9_1 = mp
  L9_1 = L9_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  L10_1 = mp
  L10_1 = L10_1.get_contextdata
  L11_1 = mp
  L11_1 = L11_1.CONTEXT_DATA_SCANREASON
  L10_1 = L10_1(L11_1)
  if L9_1 == L10_1 then
    L9_1 = mp
    L9_1 = L9_1.get_contextdata
    L10_1 = mp
    L10_1 = L10_1.CONTEXT_DATA_NEWLYCREATEDHINT
    L9_1 = L9_1(L10_1)
    if L9_1 == true then
      L9_1 = string
      L9_1 = L9_1.lower
      L10_1 = mp
      L10_1 = L10_1.get_contextdata
      L11_1 = mp
      L11_1 = L11_1.CONTEXT_DATA_PROCESSNAME
      L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L10_1(L11_1)
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
      L10_1 = string
      L10_1 = L10_1.lower
      L11_1 = mp
      L11_1 = L11_1.get_contextdata
      L12_1 = mp
      L12_1 = L12_1.CONTEXT_DATA_FILEPATH
      L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L11_1(L12_1)
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
      L11_1 = getCachePaths
      L12_1 = L9_1
      L11_1 = L11_1(L12_1)
      if L11_1 ~= nil then
        L12_1 = pairs
        L13_1 = L11_1
        L12_1, L13_1, L14_1 = L12_1(L13_1)
        for L15_1, L16_1 in L12_1, L13_1, L14_1 do
          L18_1 = L10_1
          L17_1 = L10_1.find
          L19_1 = L16_1
          L20_1 = 1
          L21_1 = true
          L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
          if L17_1 ~= nil then
            if L1_1 == true or L2_1 == true or L3_1 == true or L4_1 == true then
              L17_1 = mp
              L17_1 = L17_1.set_mpattribute
              L18_1 = "MpForceScanArchives"
              L17_1(L18_1)
            end
            if L6_1 == true then
              L17_1 = mp
              L17_1 = L17_1.set_mpattribute
              L18_1 = "Lua:ContextJarFromEmailClient"
              L17_1(L18_1)
            end
            if L0_1 == true then
              L17_1 = ParseISOHeader
              L18_1 = L8_1
              L17_1(L18_1)
            end
            L17_1 = mp
            L17_1 = L17_1.INFECTED
            return L17_1
          end
        end
      end
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
