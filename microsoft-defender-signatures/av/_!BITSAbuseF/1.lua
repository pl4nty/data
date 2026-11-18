-- Threat: \xac!BITSAbuse.F
-- Type: 13
-- Includes: AgePrevalence
-- MpAttributes: !ValidDigitalSignature & !PEPCODE:HasDigitalSignature & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  ["svchost.exe"] = true,
  ["ccsvchst.exe"] = true
}
if l_0_2[l_0_1] == true then
  return mp.CLEAN
end
local l_0_3 = {
  ["cmd.exe"] = true,
  ["powershell.exe"] = true
}
local l_0_4 = {
  ["cscript.exe"] = true,
  ["wscript.exe"] = true
}
local l_0_5 = {
  ["mshta.exe"] = true,
  ["rundll32.exe"] = true,
  ["regasm.exe"] = true,
  ["regsvc.exe"] = true,
  ["regsvr32.exe"] = true,
  ["msbuild.exe"] = true,
  ["certutil.exe"] = true,
  ["installutil.exe"] = true
}
local l_0_6 = false
local l_0_7
if l_0_3[l_0_1] == true then
  l_0_6 = true
  l_0_7 = 3289195922
elseif l_0_4[l_0_1] == true then
  l_0_6 = true
  l_0_7 = 1560572968
elseif l_0_5[l_0_1] == true then
  l_0_6 = true
  l_0_7 = 704857278
end
if l_0_6 == false or l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8 = mp.getfilename()
if not MpCommon.QueryPersistContext(l_0_8, "DroppedByBitsadmin") and not MpCommon.QueryPersistContext(l_0_8, "DroppedByBITS") then
  return mp.CLEAN
end
local l_0_9, l_0_10 = getAgePrev(true)
local l_0_11 = false
if -1 < l_0_9 or -1 < l_0_10 or mp.get_mpattribute("agePrevQueried") or mp.get_mpattribute("BM_BlockedForBITS") or MpCommon.QueryPersistContext(l_0_8, "agePrevQueried") or MpCommon.QueryPersistContext(l_0_8, "BM_BlockedForBITS") then
  l_0_11 = true
end
if l_0_11 == true then
  if mp.get_mpattribute("MpDisableCaching") then
    mp.clear_mpattribute("MpDisableCaching")
  end
  if mp.get_mpattribute("queryAgePrev") then
    mp.clear_mpattribute("queryAgePrev")
  end
  clearPersistContext(l_0_8, "queryAgePrev")
  if mp.get_mpattribute("disableCachingQueryAgePrev") then
    mp.clear_mpattribute("disableCachingQueryAgePrev")
  end
  clearPersistContext(l_0_8, "disableCachingQueryAgePrev")
end
if l_0_9 == -1 and l_0_10 == -1 and l_0_11 == false then
  if mp.IsTrustedFile(false) == true then
    return mp.CLEAN
  end
  if not MpCommon.QueryPersistContext(l_0_8, "BM_AgePrevLookedUpForBITS") then
    MpCommon.AppendPersistContext(l_0_8, "BM_AgePrevLookedUpForBITS", 0)
  end
  mp.set_mpattribute("BM_AgePrevLookedUpForBITS")
  if not mp.get_mpattribute("disableCachingQueryAgePrev") then
    mp.set_mpattribute("disableCachingQueryAgePrev")
  end
  if not MpCommon.QueryPersistContext(l_0_8, "disableCachingQueryAgePrev") then
    MpCommon.AppendPersistContext(l_0_8, "disableCachingQueryAgePrev", 0)
  end
elseif -1 < l_0_9 and l_0_9 <= 1 and -1 < l_0_10 and l_0_10 <= 100 then
  if not MpCommon.QueryPersistContext(l_0_8, "BM_BlockedForBITS") then
    MpCommon.AppendPersistContext(l_0_8, "BM_BlockedForBITS", 0)
  end
  mp.set_mpattribute("BM_BlockedForBITS")
  return mp.INFECTED
else
  mp.ReportLowfi(l_0_8, l_0_7)
end
return mp.CLEAN
