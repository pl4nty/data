-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3ba1282bd\1_luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 == "" or not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[2]).utf8p2
local l_0_1 = (this_sigattrlog[3]).utf8p2
if (string.lower)(l_0_0) == (string.lower)(l_0_1) and (sysio.IsFileExists)(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

