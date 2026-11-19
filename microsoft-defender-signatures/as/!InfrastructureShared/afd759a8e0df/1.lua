-- Threat: !InfrastructureShared
-- Name: afd759a8e0df
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "chrome.exe",
  "msedge.exe",
  "brave.exe",
  "firefox.exe",
  "opera.exe"
}
local l_0_1 = mp.GetScannedPPID()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if l_0_3 == nil then
  return mp.CLEAN
end
if not l_0_3:find("\\explorer.exe") and not IsProcNameInParentProcessTree("cmdhstr", l_0_0) then
  return mp.CLEAN
end
local l_0_4 = mp.GetProcessCommandLine(l_0_1)
if l_0_4 == nil and l_0_4 == "" then
  return mp.CLEAN
end
local l_0_5 = string.lower(l_0_4)
l_0_5 = l_0_5:gsub("%s+", " ")
if not l_0_5 or #l_0_5 <= 60 or 2200 < #l_0_5 then
  return mp.CLEAN
end
local l_0_6 = l_0_5:match("#(.*)")
if l_0_6 == nil then
  local l_0_7, l_0_8 = l_0_5:match("' ([a-z]):\\(.*)")
  if l_0_7 ~= nil and not l_0_8 ~= nil then
    l_0_6 = l_0_7 .. ":\\" .. l_0_8
  end
end
if l_0_6 == nil or l_0_6:match("%.exe ") then
  return mp.CLEAN
end
l_0_6 = l_0_6:gsub("['\"%s]+$", "")
l_0_6 = l_0_6:gsub("^['\"%s]+", "")
local l_0_9 = l_0_6:match("^\\\\") or l_0_6:match("^%a:\\")
if l_0_9 == nil then
  return mp.CLEAN
end
local l_0_10 = "^[a-z]?:?\\[a-z0-9 _%.%-\\]+\\[a-z0-9 _%.%-]+%.%a%a%a%a?$"
if l_0_6:match(l_0_10) == nil then
  return mp.CLEAN
end
local l_0_11 = l_0_6:match("%.docx?$") or l_0_6:match("%.pdf$") or l_0_6:match("%.xlsx?$") or l_0_6:match("%.pptx?$")
if not l_0_11 then
  return mp.CLEAN
end
local l_0_12 = l_0_4:match("                                  #") or l_0_4:match("#                                  ") or l_0_4:match("                                               (%a:)?\\")
if l_0_12 then
  return mp.INFECTED
end
return mp.CLEAN
