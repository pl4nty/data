-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b35073313c\0x00000932_luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[3]).utf8p1 == "" or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p2)
if (string.find)(l_0_0, "/library/application support/lemon/lemon", 0, true) or (string.find)(l_0_0, "lemon.app/contents/library/loginitems/lemon", 0, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1070.002", "ClearSystemLogs")
return mp.INFECTED

