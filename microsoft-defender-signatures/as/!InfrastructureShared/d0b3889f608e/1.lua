-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d0b3889f608e\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil and (this_sigattrlog[5]).utf8p1 ~= "" and (string.match)((this_sigattrlog[5]).utf8p1, "/%.[^/]+$") then
  (bm.trigger_sig)("HiddenProcessCreate", (this_sigattrlog[5]).utf8p1)
  return mp.INFECTED
end
return mp.CLEAN

