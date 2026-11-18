-- Threat: !InfrastructureShared
-- Name: 49d70e77bfe2
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = {
  "chrome.exe",
  "msedge.exe",
  "brave.exe",
  "firefox.exe"
}
local l_0_1 = mp.GetScannedPPID()
if not l_0_1 then
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
l_0_4 = l_0_4:gsub("%s+", " ")
if not l_0_4 or #l_0_4 <= 60 or 500 < #l_0_4 then
  return mp.CLEAN
end
local l_0_5 = l_0_4:match("#(.*)")
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = l_0_5:match("^%s*(.-)%s*$")
local l_0_6 = l_0_5:match("%.docx?$") or l_0_5:match("%.pdf$") or l_0_5:match("%.xlsx?$") or l_0_5:match("%.msi?$") or l_0_5:match("%.pptx?$")
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = l_0_5:match("^\\\\") or l_0_5:match("^%a:\\")
if l_0_7 then
  return mp.INFECTED
end
return mp.CLEAN
