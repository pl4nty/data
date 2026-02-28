local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONOPEN
if L1_1 ~= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L1_1 ~= L2_1 then
    L2_1 = mp
    L2_1 = L2_1.SCANREASON_UNKNOWN
    if L1_1 == L2_1 then
      L2_1 = mp
      L2_1 = L2_1.GetResmgrBasePlugin
      L2_1 = L2_1()
      if L2_1 == "file" then
        L2_1 = mp
        L2_1 = L2_1.getfilename
        L2_1 = L2_1()
        L0_1 = L2_1
        L2_1 = sysio
        L2_1 = L2_1.IsFileExists
        L3_1 = L0_1
        L2_1 = L2_1(L3_1)
        if not L2_1 then
          L2_1 = mp
          L2_1 = L2_1.CLEAN
          return L2_1
        end
      else
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
    else
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L2_1 = L2_1()
  L0_1 = L2_1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "agePrevQueried"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L0_1
  L4_1 = "agePrevQueried"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = MpCommon
    L2_1 = L2_1.AppendPersistContext
    L3_1 = L0_1
    L4_1 = "agePrevQueried"
    L5_1 = 0
    L2_1(L3_1, L4_1, L5_1)
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
else
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L0_1
  L4_1 = "agePrevQueried"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "agePrevQueried"
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "agePrevQueried"
      L2_1(L3_1)
    end
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.get_mpattributevalue
L3_1 = "Lua:FmsAgeInDays"
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "agePrevQueried"
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "agePrevQueried"
    L2_1(L3_1)
  end
  L2_1 = MpCommon
  L2_1 = L2_1.QueryPersistContext
  L3_1 = L0_1
  L4_1 = "agePrevQueried"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = MpCommon
    L2_1 = L2_1.AppendPersistContext
    L3_1 = L0_1
    L4_1 = "agePrevQueried"
    L5_1 = 0
    L2_1(L3_1, L4_1, L5_1)
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = getAgePrev
L3_1 = false
L2_1, L3_1 = L2_1(L3_1)
if -1 < L2_1 and -1 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.get_mpattribute
  L5_1 = "agePrevQueried"
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "agePrevQueried"
    L4_1(L5_1)
  end
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = L0_1
  L6_1 = "agePrevQueried"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = MpCommon
    L4_1 = L4_1.AppendPersistContext
    L5_1 = L0_1
    L6_1 = "agePrevQueried"
    L7_1 = 0
    L4_1(L5_1, L6_1, L7_1)
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.get_mpattribute
L5_1 = "queryAgePrev"
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = L0_1
  L6_1 = "queryAgePrev"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    goto lbl_184
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "agePrevQueried"
L4_1(L5_1)
L4_1 = MpCommon
L4_1 = L4_1.AppendPersistContext
L5_1 = L0_1
L6_1 = "agePrevQueried"
L7_1 = 0
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_184::
L4_1 = mp
L4_1 = L4_1.get_mpattribute
L5_1 = "disableCachingQueryAgePrev"
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = L0_1
  L6_1 = "disableCachingQueryAgePrev"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    goto lbl_214
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "MpDisableCaching"
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "agePrevQueried"
L4_1(L5_1)
L4_1 = MpCommon
L4_1 = L4_1.AppendPersistContext
L5_1 = L0_1
L6_1 = "agePrevQueried"
L7_1 = 0
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_214::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
