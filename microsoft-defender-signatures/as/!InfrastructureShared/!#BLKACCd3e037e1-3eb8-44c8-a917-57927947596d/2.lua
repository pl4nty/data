local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "d3e037e1-3eb8-44c8-a917-57927947596d"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = false
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_AMSI_CONTENTNAME
L1_1 = L1_1(L2_1)
if L1_1 ~= nil and L1_1 ~= "" then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = #L1_1
  if 10 < L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "^memscanvfz"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == nil then
      goto lbl_50
    end
  end
  L2_1 = #L1_1
  ::lbl_50::
  if L2_1 <= 10 then
    L2_1 = #L1_1
    if 7 < L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "^\\device\\"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = MpCommon
        L3_1 = L3_1.PathToWin32Path
        L4_1 = L1_1
        L3_1, L4_1, L5_1 = L3_1(L4_1)
        L2_1 = L2_1(L3_1, L4_1, L5_1)
        L1_1 = L2_1
      end
    end
    L2_1 = versioning
    L2_1 = L2_1.GetOrgID
    L2_1 = L2_1()
    if L2_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if L3_1 == "a30c11a9-ee43-4b6e-ab72-7be51053daba" then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L1_1
        L5_1 = "^file://"
        L3_1 = L3_1(L4_1, L5_1)
        if L3_1 ~= nil then
          L0_1 = true
        end
    end
    else
      L3_1 = sysio
      L3_1 = L3_1.IsFileExists
      L4_1 = L1_1
      L3_1 = L3_1(L4_1)
      if L3_1 then
        L0_1 = true
      end
    end
  end
end
if L0_1 == false then
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.bitor
  L4_1 = mp
  L4_1 = L4_1.FILEPATH_QUERY_FULL
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
  L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  if L1_1 ~= nil and L1_1 ~= "" then
    L2_1 = #L1_1
    if 10 < L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "^memscanvfz"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 == nil then
        goto lbl_125
      end
    end
    L2_1 = #L1_1
    ::lbl_125::
    if L2_1 <= 10 then
      L2_1 = #L1_1
      if 7 < L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "^\\device\\"
        L2_1 = L2_1(L3_1, L4_1)
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = MpCommon
          L3_1 = L3_1.PathToWin32Path
          L4_1 = L1_1
          L3_1, L4_1, L5_1 = L3_1(L4_1)
          L2_1 = L2_1(L3_1, L4_1, L5_1)
          L1_1 = L2_1
        end
      end
      L2_1 = sysio
      L2_1 = L2_1.IsFileExists
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if L2_1 then
        L0_1 = true
      end
    end
  end
end
if L0_1 then
  L2_1 = mp
  L2_1 = L2_1.IsPathExcludedForHipsRule
  L3_1 = L1_1
  L4_1 = "d3e037e1-3eb8-44c8-a917-57927947596d"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
