local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.getfilename
  L1_1 = mp
  L1_1 = L1_1.bitor
  L2_1 = mp
  L2_1 = L2_1.FILEPATH_QUERY_FNAME
  L3_1 = mp
  L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
  L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1)
  L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
  L1_1 = L1_1(L2_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  if not L0_1 or not L1_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  if L1_1 == "clamscan.exe" then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "clamav%-[%w]+%.[%w]+%.clamtmp"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
  if L1_1 == "avp.exe" then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "windows\\temp\\ioc[%w]+%.tmp"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
