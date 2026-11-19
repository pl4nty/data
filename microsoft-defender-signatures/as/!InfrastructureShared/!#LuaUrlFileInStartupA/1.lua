-- Threat: !InfrastructureShared
-- Name: !#Lua:UrlFileInStartup.A
-- Type: 13
-- Includes: LuaFuncHelper, Path
-- MpAttributes: Lua:FileInStartupFolder & Lua:URLExt & SCPT:INETShortcutTAG

local function l_0_0(l_1_0)
  local l_1_1 = l_1_0:gsub("^file:///", "")
  
  l_1_1 = l_1_1:gsub("/", "\\")
  l_1_1 = l_1_1:gsub("%%(%x%x)", function(l_2_0)
    return string.char(tonumber(l_2_0, 16))
  end)
  return l_1_1
end

local function l_0_1(l_3_0)
  return l_3_0:match("^[A-Za-z]:\\[^:*?\"<>|]+$") ~= nil
end

local l_0_2 = mp.getfilesize()
if 4096 < l_0_2 then
  mp.set_mpattribute("Lua:UrlFileInStartupFileSizeGT0x1000")
  return mp.CLEAN
end
local l_0_3 = tostring(headerpage)
if l_0_3 == nil or #l_0_3 < 24 then
  return mp.CLEAN
end
local l_0_4 = l_0_3:match("[Uu][Rr][Ll]%s*=%s*\"?(.-)[\r\n'\"]")
if l_0_4 == nil or #l_0_4 <= 3 or StringStartsWith(l_0_4, "http") then
  return mp.CLEAN
end
if 8 < #l_0_4 and StringStartsWith(l_0_4, "file:///") then
  l_0_4 = l_0_0(l_0_4)
end
if l_0_4 ~= nil and 2 < #l_0_4 then
  local l_0_5 = string.lower(l_0_4)
  if StringEndsWith(l_0_5, "supervisorprintpopup.exe") then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_5, ".html") then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_5, ".pdf") then
    return mp.CLEAN
  end
  local l_0_6 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_6 ~= nil then
    l_0_6 = string.lower(normalize_path(l_0_6))
  end
  if sysio.IsFileExists(l_0_4) then
    mp.set_mpattribute("Lua:UrlFileInStartupWithTargetExist.A")
    mp.set_mpattribute("MpInternal_researchdata=urlfileinstartuptargetexist=" .. l_0_4)
    mp.ReportLowfi(l_0_4, 3186240911)
    AppendToRollingQueue("UrlFileInStartupTargetA", l_0_5, l_0_6)
    mp.TriggerScanResource("file", l_0_4, 0)
    return mp.INFECTED
  end
  if l_0_1(l_0_4) then
    AppendToRollingQueue("UrlFileInStartupTargetA", l_0_5, l_0_6)
    mp.set_mpattribute("Lua:UrlFileInStartupWithTargetNotExist.A")
    mp.set_mpattribute("MpInternal_researchdata=urlfileinstartuptargetnotexist=" .. l_0_4)
  end
end
return mp.CLEAN
