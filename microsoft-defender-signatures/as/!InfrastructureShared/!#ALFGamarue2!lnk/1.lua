-- Threat: !InfrastructureShared
-- Name: !#ALF:Gamarue2!lnk
-- Type: 13
-- MpAttributes: //RPF:IS_Lnk

local l_0_0 = mp.getfilesize()
if l_0_0 < 24 or 255 < l_0_0 then
  return mp.CLEAN
end
if mp.bitand(mp.readu_u32(headerpage, 8), 16777215) ~= 6070466 and mp.bitand(mp.readu_u32(headerpage, 1), 16777215) ~= 6070466 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2, l_0_3, l_0_4
l_0_2, _, l_0_3, l_0_4 = string.find(l_0_1, "\160\\-({?[%w%s%p]+}?)(%.{?[%w%s%-]+}?)\"?,[%w%p%s]+%z")
if l_0_2 then
  local l_0_5 = string.lower(l_0_4)
  local l_0_6 = {
    [".exe"] = true,
    [".dll"] = true,
    [".cpl"] = true,
    [".ocx"] = true
  }
  if l_0_6[l_0_5] then
    return mp.CLEAN
  end
  local l_0_7
  local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
  if l_0_8 == mp.SCANREASON_ONOPEN or l_0_8 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
    l_0_7 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  end
  if l_0_7 == nil then
    l_0_7 = mp.getfilename():match("(.+)\\[^\\]+$")
  end
  if l_0_7 ~= nil then
    mp.ReportLowfi(l_0_7 .. "\\\194\160\\" .. l_0_3 .. l_0_4, 2406282551)
    mp.ReportLowfi(l_0_7 .. "\\\194\160\\IndexerVolumeGuid", 2012828607)
  end
  return mp.INFECTED
end
return mp.CLEAN
