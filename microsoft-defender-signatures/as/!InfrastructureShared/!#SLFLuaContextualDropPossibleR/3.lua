local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
    L0_1 = peattributes
    L0_1 = L0_1.isexe
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
    L0_1 = peattributes
    L0_1 = L0_1.isdriver
    if L0_1 == true then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
    L0_1 = peattributes
    L0_1 = L0_1.no_security
    if L0_1 ~= false then
      L0_1 = peattributes
      L0_1 = L0_1.no_exports
      if L0_1 ~= false then
        goto lbl_42
      end
    end
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    do return L0_1 end
    ::lbl_42::
    L0_1 = mp
    L0_1 = L0_1.getfilesize
    L0_1 = L0_1()
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.bitor
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_PATH
    L5_1 = mp
    L5_1 = L5_1.FILEPATH_QUERY_FNAME
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1, L4_1)
    L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    if 32768 <= L0_1 and L0_1 <= 524288 then
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = "\\temp\\"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 == nil then
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "\\desktop\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 == nil then
          L4_1 = L1_1
          L3_1 = L1_1.find
          L5_1 = "\\downloads\\"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if L3_1 == nil then
            L3_1 = mp
            L3_1 = L3_1.CLEAN
            return L3_1
          end
        end
      end
      L3_1 = {}
      L3_1["pitupi20.exe"] = true
      L3_1["build.exe"] = true
      L3_1["rcfcngzxx.exe"] = true
      L3_1["galaperidol8.exe"] = true
      L3_1["bruhadson8.exe"] = true
      L3_1["miniramon8.exe"] = true
      L4_1 = L3_1[L2_1]
      if not L4_1 then
        L5_1 = L2_1
        L4_1 = L2_1.find
        L6_1 = "^skm_c%x+.exe$"
        L4_1 = L4_1(L5_1, L6_1)
      end
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    elseif 65536 <= L0_1 and L0_1 <= 196608 then
      L3_1 = pevars
      L3_1 = L3_1.epsec
      if L3_1 == 1 then
        L3_1 = pehdr
        L3_1 = L3_1.NumberOfSections
        if L3_1 == 4 then
          goto lbl_122
        end
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_122::
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = "\\temp\\"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 == nil then
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "\\downloads\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 == nil then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
      end
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "^chrome font[ %w%.]*%.exe$"
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 == nil then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "^%d%d%d%d%d%d%-%d%d%d%d%d%d%d%d%d%d%.exe$"
        L3_1 = L3_1(L4_1, L5_1)
        if L3_1 == nil then
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = "^%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.exe$"
          L3_1 = L3_1(L4_1, L5_1)
          if L3_1 == nil then
            goto lbl_157
          end
        end
      end
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
::lbl_157::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
