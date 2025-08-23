-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellFileFixHA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 3096 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfile)(0, l_0_0)
;
(mp.readprotection)(true)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (string.gsub)(l_0_1, "[\'\"%s]+$", "")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if not (string.match)(l_0_2, "%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s[%u]:\\.+\\.+%.[%a]+$") and not (string.match)(l_0_2, "#%s*[%u]:\\.+\\.+%.[%a]+$") then
  return mp.CLEAN
end
local l_0_3 = l_0_2:match("%s[%u]:(.*)")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if l_0_3:find("[:<>]") then
  return mp.CLEAN
end
if (string.match)(l_0_3, "%.pdf$") or (string.match)(l_0_3, "%.xlsx$") or (string.match)(l_0_3, "%.docx$") or (string.match)(l_0_3, "%.pptx$") then
  return mp.INFECTED
end
return mp.CLEAN

