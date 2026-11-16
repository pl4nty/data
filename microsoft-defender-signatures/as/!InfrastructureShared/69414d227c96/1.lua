-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69414d227c96\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetRawResponseBlob)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("\'", "")
l_0_1 = l_0_1:gsub("\"", "")
l_0_1 = l_0_1:gsub("\r\n", "\n")
l_0_1 = l_0_1:gsub("\n+", "\n")
l_0_1 = l_0_1:gsub("%s+", " ")
local l_0_2 = (string.lower)(l_0_1)
if not (string.find)(l_0_2, "never logged in", 1, true) or not (string.find)(l_0_2, "cmd", 1, true) and not (string.find)(l_0_2, "powershell", 1, true) and not (string.find)(l_0_2, "conhost", 1, true) and not (string.find)(l_0_2, "curl", 1, true) and not (string.find)(l_0_2, "python", 1, true) and not (string.find)(l_0_2, "ipwy", 1, true) and not (string.find)(l_0_2, "msiexec", 1, true) and not (string.find)(l_0_2, "mshta", 1, true) and not (string.find)(l_0_2, "pushd ", 1, true) and not (string.find)(l_0_2, "/v:on", 1, true) and not (string.find)(l_0_2, "for ", 1, true) and not (string.find)(l_0_2, "tar -", 1, true) then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3.NRI_ResponseBlob = tohex(l_0_1)
;
(nri.AddTelemetry)(0, l_0_3)
return mp.INFECTED

