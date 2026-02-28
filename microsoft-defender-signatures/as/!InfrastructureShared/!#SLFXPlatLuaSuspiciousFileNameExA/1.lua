local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = versioning
L0_1 = L0_1.GetProduct
L0_1 = L0_1()
if L0_1 == 24 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_UNKNOWN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
    if L0_1 ~= L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "^[0-9a-fA-F]+"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 31) then
    goto lbl_52
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_52::
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
if L3_1 ~= nil then
  L4_1 = #L3_1
  if not (L4_1 < 5) then
    goto lbl_70
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_70::
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "/home/"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= 1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "/users/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 ~= 1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "/tmp"
    L7_1 = -4
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "/tmp/"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        goto lbl_154
      end
    end
  end
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "/dir_afs/"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "/mnt_ss_primary"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "/mnt_ss_secondary"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "/download_ss_scanpath"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        goto lbl_145
      end
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
::lbl_145::
L4_1 = IsExcludedForXplatHeuristicTrigger
L5_1 = L3_1
L6_1 = L1_1
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_154::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
