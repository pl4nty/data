-- Threat: !InfrastructureShared
-- Name: !#Lua:AccessibilityEscalationContext.B
-- Type: 10
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile & pea_isexe

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 == nil or string.len(l_0_0) < 10 or string.sub(string.lower(l_0_0), -9) ~= "\\system32" then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1 == nil or string.len(l_0_1) < 5 or string.sub(l_0_1, -4) ~= ".exe" then
  return mp.CLEAN
end
local l_0_2 = {
  ["sethc.exe"] = {
    ["sethc.exe"] = true,
    sethc = true
  },
  ["utilman.exe"] = {
    ["utilman.exe"] = true,
    ["utilman2.exe"] = true,
    utilman = true
  },
  ["osk.exe"] = {
    ["osk.exe"] = true,
    osk = true
  },
  ["magnify.exe"] = {
    ["screenmagnifier.exe"] = true,
    ["magnify.exe"] = true,
    magnifier = true
  },
  ["narrator.exe"] = {
    ["narrator.exe"] = true,
    ["sr.exe"] = true,
    narrator = true
  },
  ["displayswitch.exe"] = {
    ["displayswitch.exe"] = true,
    displayswitch = true
  },
  ["atbroker.exe"] = {
    ["atbroker.exe"] = true
  }
}
if l_0_2[l_0_1] == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_0))
l_0_0 = l_0_0:gsub("\\\\%?\\", "")
local l_0_3 = string.lower(MpCommon.ExpandEnvironmentVariables("%windir%") .. "\\system32")
if l_0_0 ~= l_0_3 then
  return mp.CLEAN
end
local l_0_4 = pe.get_versioninfo()
if l_0_4 == nil or l_0_4.OriginalFilename == nil or l_0_4.InternalName == nil or l_0_4.CompanyName == nil then
  mp.set_mpattribute("Lua:AccessibilityEscalationContext.B!noversioninfo")
  return mp.INFECTED
end
local l_0_5 = false
local l_0_6 = l_0_0 .. "\\" .. l_0_1
if (mp.IsTrustedFile(false) == true or mp.IsKnownFriendlyFile(l_0_6, true, false)) == true then
  l_0_5 = true
end
local l_0_8 = string.lower(l_0_4.CompanyName)
local l_0_9 = string.lower(l_0_4.OriginalFilename)
local l_0_10 = string.lower(l_0_4.InternalName)
if l_0_2[l_0_1][l_0_9] ~= nil and l_0_2[l_0_1][l_0_10] ~= nil and l_0_8 == "microsoft corporation" then
  if not l_0_5 then
    mp.set_mpattribute("Lua:AccessibilityEscalationContext.B!mimick")
    return mp.INFECTED
  end
  return mp.CLEAN
end
if l_0_2[l_0_1][l_0_9] == nil then
  mp.set_mpattribute("Lua:AccessibilityEscalationContext.B!originalfname_nomatch")
end
if l_0_2[l_0_1][l_0_10] == nil then
  mp.set_mpattribute("Lua:AccessibilityEscalationContext.B!internalname_nomatch")
end
if l_0_8 ~= "microsoft corporation" then
  mp.set_mpattribute("Lua:AccessibilityEscalationContext.B!company_nomatch")
end
if l_0_5 then
  mp.set_mpattribute("Lua:AccessibilityEscalationContext.B!friendly")
else
  mp.set_mpattribute("Lua:AccessibilityEscalationContext.B!unfriendly")
end
return mp.INFECTED
