-- Threat: !InfrastructureShared
-- Name: !#Lua:ZipSlip
-- Type: 12
-- MpAttributes: !RPF:TopLevelFile

local l_0_0 = mp.getfilename():lower()
local l_0_1, l_0_2 = l_0_0:match("%.(%w+)%->(.*)$")
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  ["7z"] = "Lua:FileIn7z",
  apk = "Lua:FileInApk",
  cpio = "Lua:FileInCpio",
  jar = "Lua:FileInJar",
  rar = "Lua:FileInRar",
  tar = "Lua:FileInTar",
  war = "Lua:FileInWar",
  zip = "Lua:FileInZip",
  iso = "Lua:FileInIso",
  tgz = "Lua:FileInTarGzip"
}
if l_0_3[l_0_1] ~= nil then
  mp.set_mpattribute(l_0_3[l_0_1])
else
  return mp.CLEAN
end
if l_0_2:find("../", 1, true) or l_0_2:find("..\\", 1, true) then
  mp.set_mpattribute("Lua:DirPathTraversal")
end
if l_0_2:find("../../", 1, true) or l_0_2:find("..\\..\\", 1, true) then
  mp.set_mpattribute("Lua:DirPathTraversal2plus")
end
if l_0_2:find("\\windows\\", 1, true) or l_0_2:find("/windows/", 1, true) then
  mp.set_mpattribute("Lua:DirPathWindows")
end
if l_0_2:find("\\system32\\", 1, true) or l_0_2:find("/system32/", 1, true) then
  mp.set_mpattribute("Lua:DirPathSystem32")
end
if l_0_2:find("\\microsoft\\windows\\start menu\\startup\\", 1, true) or l_0_2:find("/microsoft/windows/start menu/startup/", 1, true) then
  mp.set_mpattribute("Lua:DirPathStartup")
end
if l_0_2:find("\\programdata\\", 1, true) or l_0_2:find("/programdata/", 1, true) then
  mp.set_mpattribute("Lua:DirPathProgramData")
end
if l_0_2:find("\\program files\\", 1, true) or l_0_2:find("/program files/", 1, true) then
  mp.set_mpattribute("Lua:DirPathProgramFiles")
end
if l_0_2:find("\\program files (x86)\\", 1, true) or l_0_2:find("/program files (x86)/", 1, true) then
  mp.set_mpattribute("Lua:DirPathProgramFiles86")
end
if l_0_1 == "iso" and not l_0_2:find("\\", 2, true) and not l_0_2:find("/", 2, true) then
  mp.set_mpattribute("Lua:FileOnIsoRoot")
end
return mp.CLEAN
