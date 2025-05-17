-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2141f935e7db\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetHttpRequestHeader)("User-Agent")
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (this_sigattrlog[1]).utf8p1
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if l_0_1 == "/usr/bin/curl" and not (string.find)(l_0_0, "curl", 1, true) then
  return mp.INFECTED
end
if l_0_1 == "/usr/bin/nscurl" and not (string.find)(l_0_0, "nscurl", 1, true) then
  return mp.INFECTED
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "/private/tmp/", 1, true) or (string.find)(l_0_1, "/users/shared/", 1, true) or (string.find)(l_0_1, "/var/tmp/", 1, true) or (string.find)(l_0_1, "/library/caches/", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

