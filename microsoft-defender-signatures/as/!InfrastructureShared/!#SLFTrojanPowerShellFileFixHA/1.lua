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
local l_0_2 = (string.lower)(l_0_1)
local l_0_3 = (string.gsub)(l_0_2, "[\'\"%s]+$", "")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if not (string.match)(l_0_3, "%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s#?%s*[%a]:\\.+\\.+%.[%a]+$") and (not (string.match)(l_0_3, "#%s*[%a]:\\.+\\.+%.[%a]+$") or l_0_0 >= 300) then
  return mp.CLEAN
end
local l_0_4 = l_0_3:match("%s[%a]:(.*)")
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
if l_0_4:find("[:<>]") then
  return mp.CLEAN
end
if not (string.match)(l_0_3, "h.?.?.?.?.?.?t.?.?.?.?.?.?t.?.?.?.?.?.?p.?.?.?.?.?.?s?.?.?.?.?.?.?:.?.?.?.?.?.?/") and not (string.match)(l_0_3, " ping ") then
  return mp.CLEAN
end
if (string.match)(l_0_4, "%.pdf$") or (string.match)(l_0_4, "%.xlsx$") or (string.match)(l_0_4, "%.docx$") or (string.match)(l_0_4, "%.pptx$") then
  return mp.INFECTED
end
return mp.CLEAN

