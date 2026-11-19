-- Threat: !InfrastructureShared
-- Name: 6478ee2f8e8c
-- Type: 21

if not peattributes.isdll and not peattributes.isexe then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_1 == nil or string.len(l_0_1) < 4 then
  return mp.CLEAN
end
if l_0_0:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("system32", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("syswow64", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("winsxs", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("steamapps", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("mingw64", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("site-packages", 1, true) then
  return mp.CLEAN
end
if l_0_1:sub(1, 3) == "lib" then
  return mp.CLEAN
end
local l_0_2 = {
  ["ffmpeg.dll"] = true,
  ["cryptx.xs.dll"] = true
}
if l_0_2[l_0_1] then
  return mp.CLEAN
end
local l_0_3 = mp.GetCertificateInfo()
if l_0_3 == nil or #l_0_3 < 1 then
  return mp.CLEAN
end
if mp.IsTrustedFile() then
  return mp.CLEAN
end
return mp.INFECTED
