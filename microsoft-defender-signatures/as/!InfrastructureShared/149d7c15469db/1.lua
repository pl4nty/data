-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\149d7c15469db\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = (mp.hstr_full_log)()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = false
if (l_0_2[2]).matched or (l_0_2[3]).matched or (l_0_2[4]).matched or (l_0_2[5]).matched or (l_0_2[6]).matched or (l_0_2[7]).matched then
  l_0_3 = true
end
if (l_0_2[13]).matched and ((l_0_2[11]).matched or (l_0_2[12]).matched) then
  l_0_3 = true
end
if l_0_3 == false then
  return mp.CLEAN
end
local l_0_4 = false
if (l_0_2[8]).matched or (l_0_2[9]).matched or (l_0_2[10]).matched or (l_0_2[11]).matched or (l_0_2[12]).matched or (l_0_2[13]).matched then
  l_0_4 = true
end
if l_0_4 == false then
  return mp.CLEAN
end
local l_0_5 = (mp.GetScannedPPID)()
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = (mp.GetProcessCommandLine)(l_0_5)
if l_0_6 == nil or #l_0_6 < 20 or #l_0_6 > 300 then
  return mp.CLEAN
end
if (string.find)(l_0_6, "%\n") ~= nil then
  return mp.CLEAN
end
l_0_6 = l_0_6:lower()
local l_0_7 = (string.gsub)(l_0_6, "%^", "")
l_0_7 = (string.gsub)(l_0_6, "%`", "")
local l_0_8 = (string.match)(l_0_7, "(https?://[^%s%?%)%]%\'\"}]+)")
if l_0_8 == "" or l_0_8 == nil or #l_0_8 < 10 then
  return mp.CLEAN
end
local l_0_9 = {}
l_0_9.SIG_CONTEXT = "CMDHSTR"
l_0_9.CONTENT_SOURCE = "CMDLINE"
l_0_9.FILELESS = "true"
l_0_9.CMDLINE_URL = "true"
l_0_9.BREAK_AT_FIRST_HIT_MALWARE = "60"
local l_0_10 = {}
;
(table.insert)(l_0_10, l_0_8)
if CheckUrlReputationSimple(l_0_10, l_0_9, 60) then
  return mp.INFECTED
end
return mp.CLEAN

