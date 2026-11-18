-- Threat: !InfrastructureShared
-- Name: 118fe769a377
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 56064 or 458752 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
if 72448 < l_0_0 and mp.get_mpattribute("RPF:XlsAbnormalSheetStateBits") and mp.get_mpattribute("MpExcelFormulaRoutines") then
  local l_0_1 = tostring(mp.readfile(0, l_0_0))
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, "%d%.ocx.*%d%.ocx.*%d%.ocx") ~= nil and string.find(l_0_1, "system32", 1, true) ~= nil and string.find(l_0_1, "egsv", 1, true) ~= nil and string.find(l_0_1, "urldownloadtofil", 1, true) ~= nil and string.find(l_0_1, "jjccbb", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
