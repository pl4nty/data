-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69414d227c96\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetRawResponseBlob)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("\'", "")
l_0_1 = l_0_1:gsub("\"", "")
l_0_1 = l_0_1:gsub("%s+", " ")
if not (string.find)(l_0_1, "never logged in", 1, true) or not (string.find)(l_0_1, "cmd", 1, true) and not (string.find)(l_0_1, "powershell", 1, true) and not (string.find)(l_0_1, "conhost", 1, true) and not (string.find)(l_0_1, "curl", 1, true) and not (string.find)(l_0_1, "python", 1, true) and not (string.find)(l_0_1, "ipwy", 1, true) and not (string.find)(l_0_1, "msiexec", 1, true) and not (string.find)(l_0_1, "mshta", 1, true) and not (string.find)(l_0_1, "pushd ", 1, true) and not (string.find)(l_0_1, "/v:on", 1, true) and not (string.find)(l_0_1, "for ", 1, true) and not (string.find)(l_0_1, "tar -", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2.NRI_ResponseBlob = tohex(l_0_0)
;
(nri.AddTelemetry)(0, l_0_2)
return mp.INFECTED

