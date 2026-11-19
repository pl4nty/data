-- Threat: TrojanDownloader:O97M/Qakbot.RQL!MTB
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_OLE_FILE & MpExcelFormulaRoutines & RPF:XlsWorksheetVisible

local l_0_0 = mp.getfilesize()
if l_0_0 < 126976 or 458752 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(110128, 200))
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "regsvr32 %-silent %.%.\\drezd") ~= nil then
  return mp.INFECTED
elseif 131072 < l_0_0 then
  local l_0_2 = tostring(mp.readfile(121696, 200))
  l_0_2 = string.lower(l_0_2)
  local l_0_3 = tostring(mp.readfile(127776, 600))
  l_0_3 = string.lower(l_0_3)
  if string.find(l_0_2, "regsvr32 %-silent %.%.\\drezd") ~= nil or string.find(l_0_3, "regsvr32 %-silent %.%.\\celod") ~= nil then
    return mp.INFECTED
  elseif 407552 < l_0_0 then
    local l_0_4 = tostring(mp.readfile(406992, 200))
    l_0_4 = string.lower(l_0_4)
    local l_0_5 = tostring(mp.readfile(403376, 200))
    l_0_5 = string.lower(l_0_5)
    if string.find(l_0_4, "regsvr32 %-silent %.%.\\fiosa") ~= nil or string.find(l_0_4, "regsvr32 %-silent %.%.\\violaf") ~= nil or string.find(l_0_5, "regsvr32 %-silent %.%.\\xertis") ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
