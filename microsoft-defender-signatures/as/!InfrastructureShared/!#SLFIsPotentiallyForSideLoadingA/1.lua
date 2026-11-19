-- Threat: !InfrastructureShared
-- Name: !#SLF:IsPotentiallyForSideLoading.A
-- Type: 12
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & BM_MZ_DLL & MpNewlyCreatedHint

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = {
  ["mpclient.dll"] = true,
  ["mptrace.dll"] = true
}
if l_0_2[l_0_1] ~= nil then
  local l_0_3 = mp.getfilesize()
  if l_0_3 < 256 or 2097152 < l_0_3 then
    return mp.CLEAN
  end
  local l_0_4 = mp.GetCertificateInfo()
  for l_0_5, l_0_6 in pairs(l_0_4) do
    if l_0_6.Signers ~= nil and mp.IsTrustedFile(true, false) then
      return mp.CLEAN
    end
  end
  if string.find(l_0_0, "programdata\\microsoft", 1, true) ~= nil then
    return mp.CLEAN
  end
  if string.find(l_0_0, "program files", 1, true) ~= nil then
    return mp.CLEAN
  end
  if string.find(l_0_0, ":\\windows\\system32", 1, true) ~= nil then
    return mp.CLEAN
  end
  if string.find(l_0_0, ":\\windows\\syswow64", 1, true) ~= nil then
    return mp.CLEAN
  end
  if string.find(l_0_0, ":\\windows\\winsxs", 1, true) ~= nil then
    return mp.CLEAN
  end
  if string.find(l_0_0, ":\\windows\\servicing", 1, true) ~= nil then
    return mp.CLEAN
  end
  if string.find(l_0_0, ":\\$extend\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  local l_0_7 = l_0_0 .. "\\" .. l_0_1
  AppendToRollingQueue("DllSideloadMonitor", l_0_7, nil, 5000)
  mp.set_mpattribute("Lua:PossiblyForSideloading!" .. l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
