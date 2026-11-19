-- Threat: !InfrastructureShared
-- Name: 1a5b3a1439e66
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_1 = "Startup"
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_1 = "Shutdown"
  l_0_0 = this_sigattrlog[2].utf8p1
end
l_0_0 = string.sub(l_0_0, 1, -#"\\parameters" - 2)
local l_0_2 = sysio.RegOpenKey(l_0_0:match("(.+)\\%x+"))
local l_0_3 = sysio.GetRegValueAsString(l_0_2, "FileSysPath")
local l_0_4 = sysio.GetRegValueAsString(l_0_2, "GPOName"):lower()
local l_0_5, l_0_6 = parseGpoSysvolPath(l_0_3)
if l_0_4 ~= l_0_6 then
  bm.add_related_string("GPO-error", "guid mismatch between network FileSysPath and GPOName registry values", bm.RelatedStringBMReport)
end
local l_0_7 = sysio.RegOpenKey(l_0_0)
local l_0_8 = sysio.GetRegValueAsString(l_0_7, "Script")
local l_0_9 = l_0_3 .. "\\Scripts\\" .. l_0_1 .. "\\" .. l_0_8
local l_0_10 = getGpoDataStorePath(l_0_5, l_0_4)
if l_0_10 == nil then
  return mp.CLEAN
end
local l_0_11 = l_0_10 .. "\\Scripts\\" .. l_0_1 .. "\\" .. l_0_8
local l_0_12 = {
  ["{31b2f340-016d-11d2-945f-00c04fb984f9}"] = "Default Domain Policy",
  ["{6ac1786c-016f-11d2-945f-00c04fb984f9}"] = "Default Domain Controllers Policy"
}
if l_0_12[l_0_4] then
  bm.add_related_string("GPO-script-suspicious", l_0_12[l_0_4], bm.RelatedStringBMReport)
end
local l_0_13 = sysio.GetFileSize(l_0_11)
if GetRollingQueueKeyValue("GPO-Script-LocalPath-Current", l_0_11) ~= l_0_13 then
  AppendToRollingQueue("GPO-Script-NetworkPath-History", l_0_9, l_0_13, 604800, 300, 0)
  AppendToRollingQueue("GPO-Script-LocalPath-History", l_0_11, l_0_13, 604800, 300, 0)
  AppendToRollingQueue("GPO-Script-LocalPath-Current", l_0_11, l_0_13, 604800, 300, 1)
  bm.add_related_file(l_0_11)
end
return mp.INFECTED
