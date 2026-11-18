-- Threat: !InfrastructureShared
-- Name: 34783c50c632
-- Type: 21

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  ["httpd.exe"] = true,
  ["tomcat.exe"] = true,
  ["nginx.exe"] = true
}
local l_0_2 = l_0_0.OriginalFilename
if not l_0_1[l_0_2] then
  return mp.CLEAN
end
local l_0_3 = l_0_0.FileVersion
local l_0_4 = pe.get_fixedversioninfo().FileVersion
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end

local function l_0_5(l_1_0)
  local l_1_1 = crypto.shr64(l_1_0, 48)
  local l_1_2 = crypto.bitand(crypto.shr64(l_1_0, 32), 65535)
  local l_1_3 = crypto.bitand(crypto.shr64(l_1_0, 16), 65535)
  local l_1_4 = crypto.bitand(l_1_0, 65535)
  return tostring(l_1_1) .. "." .. tostring(l_1_2) .. "." .. tostring(l_1_3) .. "." .. tostring(l_1_4)
end

l_0_4 = l_0_5(l_0_4)
local l_0_6 = MpCommon.PathToWin32Path(mp.getfilename(mp.FILEPATH_QUERY_FULL)):lower()
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
local l_0_7 = "AppName:" .. l_0_2
local l_0_8 = "AppVersion:" .. l_0_4
local l_0_9 = "AppVersionStr:" .. l_0_3
local l_0_10 = {}
table.insert(l_0_10, l_0_7)
table.insert(l_0_10, l_0_8)
table.insert(l_0_10, l_0_9)
MpCommon.SetPersistContext(l_0_6, l_0_10, 0)
return mp.INFECTED
