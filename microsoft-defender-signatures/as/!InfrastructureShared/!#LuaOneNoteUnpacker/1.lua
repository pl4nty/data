local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = ""
L2_1 = {}
if 5120000 < L0_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L3_1.pe = "\231\022\227\189e&\017E\164\196\141M\vz\158\172\144\001\020MZ\144\000"
L3_1.lnk = "\231\022\227\189e&\017E\164\196\141M\vz\158\172\144\001\020L\000\000\000\144\000"
L3_1.script = "\231\022\227\189e&\017E\164\196\141M\vz\158\172\144\002\255\144\023\n\b\b\006\006\006\006\n\004\016\016On Erroron errorScriptscriptSCRIPT<html>powershell#@~^<HTA:APPLICATION<hta:application\144\000"
L3_1.bat = "\231\022\227\189e&\017E\164\196\141M\vz\158\172\144\001\020\144\023\002\005\005@echo@ECHO\144\000"
L3_1.chm = "\231\022\227\189e&\017E\164\196\141M\vz\158\172\144\001\020ITSF\144\000"
L4_1 = next
L5_1 = L3_1
L6_1 = nil
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = pcall
  L10_1 = mp
  L10_1 = L10_1.BMSearchFile
  L11_1 = 0
  L12_1 = L0_1
  L13_1 = L8_1
  L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 and L10_1 ~= -1 then
    L11_1 = mp
    L11_1 = L11_1.set_mpattribute
    L12_1 = "//Lua:OneNoteFileData"
    L11_1(L12_1)
    L11_1 = mp
    L11_1 = L11_1.readprotection
    L12_1 = false
    L11_1(L12_1)
    L11_1 = 36
    L12_1 = L10_1 + L11_1
    if L0_1 > L12_1 then
      L12_1 = mp
      L12_1 = L12_1.readfile
      L13_1 = L10_1
      L14_1 = L11_1
      L12_1 = L12_1(L13_1, L14_1)
      L13_1 = mp
      L13_1 = L13_1.readu_u64
      L14_1 = L12_1
      L15_1 = 17
      L13_1 = L13_1(L14_1, L15_1)
      L14_1 = L10_1 + L11_1
      L14_1 = L14_1 + L13_1
      if L0_1 > L14_1 then
        L14_1 = mp
        L14_1 = L14_1.readfile
        L15_1 = L10_1 + L11_1
        L16_1 = L13_1
        L14_1 = L14_1(L15_1, L16_1)
        L15_1 = mp
        L15_1 = L15_1.readprotection
        L16_1 = true
        L15_1(L16_1)
        L15_1 = crypto
        L15_1 = L15_1.Sha1Buffer
        L16_1 = L14_1
        L17_1 = 0
        L18_1 = #L14_1
        L15_1 = L15_1(L16_1, L17_1, L18_1)
        L16_1 = L2_1[L15_1]
        if not L16_1 then
          L2_1[L15_1] = true
          if L7_1 == "pe" then
            L1_1 = "PE"
            L16_1 = mp
            L16_1 = L16_1.set_mpattribute
            L17_1 = "//Lua:OneNoteFileDataPE"
            L16_1(L17_1)
          elseif L7_1 == "bat" then
            L1_1 = "BAT"
            L16_1 = mp
            L16_1 = L16_1.set_mpattribute
            L17_1 = "//Lua:OneNoteFileDataBAT"
            L16_1(L17_1)
          elseif L7_1 == "script" then
            L1_1 = "SCRIPT"
            L16_1 = mp
            L16_1 = L16_1.set_mpattribute
            L17_1 = "//Lua:OneNoteFileDataSCRIPT"
            L16_1(L17_1)
          elseif L7_1 == "chm" then
            L1_1 = "CHM"
            L16_1 = mp
            L16_1 = L16_1.set_mpattribute
            L17_1 = "//Lua:OneNoteFileDataCHM"
            L16_1(L17_1)
          elseif L7_1 == "lnk" then
            L1_1 = "LNK"
            L16_1 = mp
            L16_1 = L16_1.set_mpattribute
            L17_1 = "//Lua:OneNoteFileDataLNK"
            L16_1(L17_1)
          end
          L16_1 = mp
          L16_1 = L16_1.vfo_add_buffer
          L17_1 = L14_1
          L18_1 = "[ONENOTE_FILEDATA_"
          L19_1 = L1_1
          L20_1 = "]"
          L18_1 = L18_1 .. L19_1 .. L20_1
          L19_1 = mp
          L19_1 = L19_1.ADD_VFO_TAKE_ACTION_ON_DAD
          L16_1(L17_1, L18_1, L19_1)
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
