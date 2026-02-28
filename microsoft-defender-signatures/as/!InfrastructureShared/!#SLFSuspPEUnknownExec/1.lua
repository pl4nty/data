local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.getfilesize
  L1_1 = L1_1()
  if 1048576 < L1_1 then
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
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1, L5_1)
  L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "cache\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = ".json"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = ".pyd"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L5_1 = L3_1
        L4_1 = L3_1.find
        L6_1 = ".xml"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L5_1 = L3_1
          L4_1 = L3_1.find
          L6_1 = ".lng"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            goto lbl_71
          end
        end
      end
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_71::
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "appdata"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L5_1 = L2_1
    L4_1 = L2_1.find
    L6_1 = "programdata"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_contextdata
      L5_1 = mp
      L5_1 = L5_1.CONTEXT_DATA_HAS_MOTW_ADS
      L4_1 = L4_1(L5_1)
      if L4_1 ~= true then
        goto lbl_159
      end
      L4_1 = mp
      L4_1 = L4_1.GetMOTWZone
      L4_1 = L4_1()
      if not (3 <= L4_1) then
        goto lbl_159
      end
    end
  end
  L4_1 = epcode
  L4_1 = L4_1[1]
  if L4_1 ~= 232 then
    L4_1 = epcode
    L4_1 = L4_1[1]
    if L4_1 ~= 233 then
      L4_1 = epcode
      L4_1 = L4_1[1]
      if L4_1 == 85 then
        L4_1 = epcode
        L4_1 = L4_1[2]
        if L4_1 == 139 then
          goto lbl_145
        end
        L4_1 = epcode
        L4_1 = L4_1[2]
        if L4_1 == 137 then
          goto lbl_145
        end
      end
      L4_1 = epcode
      L4_1 = L4_1[1]
      if L4_1 == 75 then
        L4_1 = epcode
        L4_1 = L4_1[2]
        if L4_1 == 131 then
          goto lbl_145
        end
      end
      L4_1 = epcode
      L4_1 = L4_1[1]
      if L4_1 == 106 then
        L4_1 = epcode
        L4_1 = L4_1[2]
        if L4_1 == 96 then
          goto lbl_145
        end
      end
      L4_1 = epcode
      L4_1 = L4_1[3]
      if L4_1 == 85 then
        L4_1 = epcode
        L4_1 = L4_1[1]
        if L4_1 == 139 then
          goto lbl_145
        end
      end
      L4_1 = epcode
      L4_1 = L4_1[1]
      if L4_1 ~= 131 then
        goto lbl_148
      end
    end
  end
  ::lbl_145::
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_148::
  L4_1 = pe
  L4_1 = L4_1.get_versioninfo
  L4_1 = L4_1()
  if L4_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_159::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
