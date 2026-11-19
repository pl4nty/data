-- Threat: !InfrastructureShared
-- Name: !#Lua:SingleFileIn7z
-- Type: 12

local l_0_0 = mp.getfilesize()
mp.readprotection(false)
if l_0_0 < 512 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 2948364855 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 13) == 0 then
  return mp.CLEAN
end
local l_0_1 = mp.readu_u32(headerpage, 21)
if l_0_1 < 50 then
  return mp.CLEAN
end
if l_0_1 > mp.FOOTERPAGE_SZ then
  return mp.CLEAN
end
if mp.readu_u32(footerpage, mp.FOOTERPAGE_SZ - l_0_1 + 1) ~= 394241 then
  return mp.CLEAN
end
local l_0_2 = mp.readu_u16(footerpage, mp.FOOTERPAGE_SZ - l_0_1 + 1 + 46) - 1
if l_0_2 < 8 or 256 < l_0_2 then
  return mp.CLEAN
end
local l_0_3 = l_0_1 - 48
if l_0_2 > l_0_3 then
  return mp.CLEAN
end
local l_0_4 = mp.readfile(l_0_0 - l_0_3 - 1, l_0_2)
local l_0_5 = string.gsub(l_0_4, "%z", "")
mp.set_mpattribute("Lua:SingleFileIn7Z")
mp.UfsSetMetadataBool("Lua:SingleFileIn7Z!ufs", true)
local l_0_6 = string.lower(string.sub(l_0_5, -4))
local l_0_7 = string.lower(string.sub(l_0_5, -3))
if l_0_6 == ".zip" then
  mp.set_mpattribute("Lua:SingleZipIn7z")
elseif l_0_6 == ".vbs" then
  mp.set_mpattribute("Lua:SingleVBSIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_6 == ".lnk" then
  mp.set_mpattribute("Lua:SingleLNKIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_6 == ".wsf" then
  mp.set_mpattribute("Lua:SingleWSFIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_6 == ".vbe" then
  mp.set_mpattribute("Lua:SingleVBEIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_6 == ".jse" then
  mp.set_mpattribute("Lua:SingleJSEIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_6 == "html" then
  mp.set_mpattribute("Lua:SingleHTAIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_6 == ".exe" then
  mp.set_mpattribute("Lua:SingleEXEIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_6 == ".dll" then
  mp.set_mpattribute("Lua:SingleDLLIn7z")
elseif l_0_6 == ".com" then
  mp.set_mpattribute("Lua:SingleCOMIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_6 == ".ps1" then
  mp.set_mpattribute("Lua:SinglePSIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_6 == ".bat" then
  mp.set_mpattribute("Lua:SingleBATIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_6 == ".rar" then
  mp.set_mpattribute("Lua:SingleRarIn7z")
elseif l_0_6 == ".ace" then
  mp.set_mpattribute("Lua:SingleACEIn7z")
end
if l_0_7 == ".js" then
  mp.set_mpattribute("Lua:SingleJSIn7z")
  mp.set_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
elseif l_0_7 == ".7z" then
  mp.set_mpattribute("Lua:Single7zIn7z")
end
return mp.CLEAN
