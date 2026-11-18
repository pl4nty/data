-- Threat: !InfrastructureShared
-- Name: 55b3d07212ad
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
if l_0_0:find("nvcpl.dll") ~= nil then
  return mp.CLEAN
end
if l_0_0:find("cceraser.dll") ~= nil then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
local l_0_2, l_0_3 = l_0_0:find("rundll32.exe")
if l_0_2 == nil then
  l_0_2, l_0_3 = l_0_0:find("rundll32", 1, true)
end
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.sub(l_0_0, l_0_3 - string.len(l_0_0))
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_6 = "|" .. l_0_5:match("(%w+%.exe)$") .. "|"
local l_0_7 = "|nvvsvc.exe|salnst.exe|"
if l_0_7:find(l_0_6, 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_8 = l_0_4:match("([^,]+)")
if l_0_8 == nil then
  l_0_8 = l_0_4
end
local l_0_9 = l_0_8:gsub("%s*(.-)%s*$", "%1")
local l_0_10 = l_0_9:gsub("\"", "")
if l_0_10:find(":\\", 1, true) == nil then
  if l_0_5 == nil then
    return mp.CLEAN
  end
  local l_0_11 = l_0_5:match("(.+)\\[^\\]+$")
  local l_0_12 = 16
  while l_0_10:find("..\\", 1, true) ~= nil and 0 < l_0_12 do
    l_0_12 = l_0_12 - 1
    if l_0_10:find("..\\", 1, true) ~= nil then
      l_0_11 = l_0_11:match("(.+)\\[^\\]+$")
      l_0_10 = l_0_10:gsub("^%.%.\\", "")
    end
  end
  if l_0_10:find(".\\", 1, true) ~= nil then
    l_0_10 = l_0_10:gsub("%.\\", "")
  end
  if l_0_11 == nil then
    return mp.INFECTED
  end
  if l_0_10 == nil then
    return mp.INFECTED
  end
  l_0_10 = l_0_11 .. "\\" .. l_0_10
end
mp.ReportLowfi(l_0_10, 1784912360)
return mp.INFECTED
