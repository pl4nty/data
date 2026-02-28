local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
    L1_1 = L1_1.getfilesize
    L1_1 = L1_1()
    if L1_1 == nil then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = mp
    L2_1 = L2_1.getfilename
    L3_1 = mp
    L3_1 = L3_1.bitor
    L4_1 = mp
    L4_1 = L4_1.bitor
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_FNAME
    L6_1 = mp
    L6_1 = L6_1.FILEPATH_QUERY_PATH
    L4_1 = L4_1(L5_1, L6_1)
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
    L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L3_1(L4_1, L5_1)
    L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
    if L3_1 == nil or L2_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    if L3_1 == "amsi.dll" then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = mp
      L5_1 = L5_1.get_contextdata
      L6_1 = mp
      L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
      L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1)
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
      L6_1 = L4_1
      L5_1 = L4_1.match
      L7_1 = "(.*).exe"
      L5_1 = L5_1(L6_1, L7_1)
      L7_1 = L5_1
      L6_1 = L5_1.find
      L8_1 = "rufus"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 then
        L5_1 = "rufus"
      end
      L7_1 = L5_1
      L6_1 = L5_1.find
      L8_1 = "recover"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 then
        L5_1 = "recovery"
      end
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:AmsiDll!"
      L8_1 = L5_1
      L7_1 = L7_1 .. L8_1
      L6_1(L7_1)
      L6_1 = mp
      L6_1 = L6_1.IsTrustedFile
      L6_1 = L6_1()
      if L6_1 then
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "Lua:AmsiDllTrusted"
        L6_1(L7_1)
      else
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "Lua:AmsiDllNotTrusted"
        L6_1(L7_1)
      end
      L7_1 = L2_1
      L6_1 = L2_1.find
      L8_1 = "\\device\\harddiskvolume"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L7_1 = L2_1
        L6_1 = L2_1.find
        L8_1 = ":\\windows\\winsxs\\"
        L9_1 = 1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          L7_1 = L2_1
          L6_1 = L2_1.find
          L8_1 = ":\\windows\\system32\\"
          L9_1 = 1
          L10_1 = true
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if not L6_1 then
            L7_1 = L2_1
            L6_1 = L2_1.find
            L8_1 = ":\\windows\\syswow64"
            L9_1 = 1
            L10_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
            if not L6_1 then
              goto lbl_129
            end
          end
          L6_1 = mp
          L6_1 = L6_1.set_mpattribute
          L7_1 = "Lua:AmsiDllInKnownLocation"
          L6_1(L7_1)
          goto lbl_133
          ::lbl_129::
          L6_1 = mp
          L6_1 = L6_1.set_mpattribute
          L7_1 = "Lua:AmsiDllInNonStandardLocation"
          L6_1(L7_1)
        end
      end
      ::lbl_133::
      L6_1 = mp
      L6_1 = L6_1.get_mpattribute
      L7_1 = "BM_MZ_FILE"
      L6_1 = L6_1(L7_1)
      if not L6_1 then
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "Lua:AmsiDllIsNonPE"
        L6_1(L7_1)
      end
      if L1_1 < 10240 or 204800 < L1_1 then
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "Lua:AmsiDllIsNonStandardSize"
        L6_1(L7_1)
        if L1_1 == 0 then
          L6_1 = mp
          L6_1 = L6_1.set_mpattribute
          L7_1 = "Lua:AmsiDllZeroFileSize"
          L6_1(L7_1)
        end
      end
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
