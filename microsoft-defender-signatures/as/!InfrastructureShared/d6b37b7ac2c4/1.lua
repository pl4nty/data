-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b37b7ac2c4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 20
if l_0_0 * 10000000 < (bm.GetSignatureMatchDuration)() then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  l_0_1 = (this_sigattrlog[1]).utf8p1
end
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\program files", 1, true) or (string.find)(l_0_1, "\\system32\\driverstore\\filerepository", 1, true) or StringEndsWith(l_0_1, "u3boostsvr.exe") or StringEndsWith(l_0_1, "u3boostsvr64.exe") then
  return mp.CLEAN
end
local l_0_2 = nil
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  l_0_2 = (this_sigattrlog[4]).utf8p1
end
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = l_0_1:match("^(.*)%.exe$")
local l_0_4 = l_0_2:match("^(.*)loc%.dll$")
if l_0_3 ~= l_0_4 then
  return mp.CLEAN
end
local l_0_5 = (sysio.GetFileSize)(l_0_1)
if l_0_5 <= 20000 then
  return mp.CLEAN
end
local l_0_6 = tostring((sysio.ReadFile)(l_0_1, l_0_5 - 5376, l_0_5))
if isnull(l_0_6) then
  return mp.CLEAN
end
if (string.find)(l_0_6, "ASUSTeK Computer", 1, true) then
  (bm.add_related_file)(l_0_1)
  ;
  (bm.add_related_file)(l_0_2)
  return mp.INFECTED
end
return mp.CLEAN

