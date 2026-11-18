-- Threat: !InfrastructureShared
-- Name: !#Lua:Gamarue!lnk
-- Type: 13
-- MpAttributes: //RPF:IS_Lnk

local l_0_0 = mp.getfilesize()
if l_0_0 < 24 or 255 < l_0_0 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 33) ~= 1554039296 and mp.readu_u32(headerpage, 33) ~= 2697077248 and mp.bitand(mp.readu_u32(headerpage, 1), 16777215) ~= 6070466 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2 = string.lower(l_0_1)
local l_0_3, l_0_4, l_0_5
if l_0_2:find("^%l:\\windows\\system32\\rundll32%.exe%z") then
  while true do
    l_0_3, _, l_0_4, l_0_5 = string.find(l_0_1, "\160\\(%l+)(%.%l%l%l),%l+%z")
    if l_0_3 then
      break
    end
    l_0_3, _, l_0_4, l_0_5 = string.find(l_0_1, "\160\\(~%$%l+)(%.%l%l%l),%l+%z")
    if l_0_3 then
      break
    end
    l_0_3, _, l_0_4, l_0_5 = string.find(l_0_1, "\160\\(%w+%.%w+%.%w+%.%w+%.%w+%.%w+%.%w+)(%.%w+),%w+%z")
    if l_0_3 then
      break
    end
    l_0_3, _, l_0_4, l_0_5 = string.find(l_0_1, "\160\\(%w+)(%.%w+),%w+%z")
    if l_0_3 then
      break
    end
    l_0_3, _, l_0_4, l_0_5 = string.find(l_0_1, "\160\\({?[%w%s%p]+}?)(%.{?[%w%s%-]+}?)\"?,[%w%p%s]+%z")
    if l_0_3 then
      break
    end
    break
  end
else
  l_0_3, _, l_0_4, l_0_5 = string.find(l_0_1, "\194\160\\(%w+%.%w+%.%w+%.%w+%.%w+%.%w+%.%w+)(%.%w+),%w+%z")
  if not l_0_3 then
    l_0_3, _, l_0_4, l_0_5 = string.find(l_0_1, "\160\\\\\\\\\\\\\\\\\\\\\\(%p%p%p%p%p-)(%.%d),%w+%z")
  end
end
if l_0_3 then
  local l_0_6 = {
    [".exe"] = true,
    [".dll"] = true,
    [".cpl"] = true,
    [".ocx"] = true
  }
  if l_0_6[l_0_5] then
    return mp.CLEAN
  end
  local l_0_7 = mp.get_parent_filehandle()
  if l_0_7 == nil then
    return mp.CLEAN
  end
  local l_0_8 = mp.readfile_by_handle(l_0_7, 0, 64)
  if l_0_8 == nil then
    return mp.CLEAN
  end
  if mp.readu_u32(l_0_8, 1) ~= 76 then
    return mp.CLEAN
  end
  if mp.readu_u32(l_0_8, 57) ~= 7 then
    return mp.CLEAN
  end
  local l_0_9
  local l_0_10 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
  if l_0_10 == mp.SCANREASON_ONOPEN or l_0_10 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
    l_0_9 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  end
  if l_0_9 == nil then
    l_0_9 = mp.getfilename():match("(.+)\\[^\\]+$")
  end
  if l_0_9 ~= nil then
    mp.ReportLowfi(l_0_9 .. "\\\194\160\\" .. l_0_4 .. l_0_5, 2406282551)
    mp.ReportLowfi(l_0_9 .. "\\\194\160\\IndexerVolumeGuid", 2012828607)
  end
  return mp.INFECTED
end
return mp.CLEAN
