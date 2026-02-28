local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L1_1 == nil or L1_1 == "" or L0_1 == nil or L0_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L1_1 == "cron" or L1_1 == "crond" then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "/usr/bin"
  L5_1 = -8
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "/usr/sbin"
    L5_1 = -9
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L0_1
      L4_1 = "->usr/sbin"
      L5_1 = -10
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L0_1
        L4_1 = "->sbin"
        L5_1 = -6
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L0_1
          L4_1 = "/opt"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 ~= 1 then
            goto lbl_91
          end
        end
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.getfilesize
  L2_1 = L2_1()
  if L2_1 == nil or L2_1 < 307200 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "BM_LargeSizeCronBinary"
  L3_1(L4_1)
  goto lbl_123
  ::lbl_91::
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "BM_MasqueradeCronPath"
  L2_1(L3_1)
else
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "."
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= 1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "/."
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      goto lbl_119
    end
  end
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "BM_CronWithHiddenName"
  L2_1(L3_1)
  goto lbl_123
  ::lbl_119::
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "BM_MasqueradeCronName"
  L2_1(L3_1)
end
::lbl_123::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
