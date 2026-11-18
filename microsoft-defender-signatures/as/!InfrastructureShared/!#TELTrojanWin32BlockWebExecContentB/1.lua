-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/BlockWebExecContent.B
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.GetScanSource()
if l_0_0 ~= mp.SCANSOURCE_IOAV_WEB then
  return mp.CLEAN
end
local l_0_1 = mp.IOAVGetDownloadUrl()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = string.match(string.lower(l_0_1), "https?://([^/]+)/")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = false
if string.find(l_0_2, "dropbox%.com") then
  l_0_3 = true
end
if string.find(l_0_2, "drive%.google%.com") then
  l_0_3 = true
end
if l_0_3 == false then
  return mp.CLEAN
end
return mp.INFECTED
