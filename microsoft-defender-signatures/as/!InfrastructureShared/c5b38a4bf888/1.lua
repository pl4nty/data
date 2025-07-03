-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b38a4bf888\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (this_sigattrlog[1]).utf8p1
if l_0_0 ~= nil and l_0_0 ~= "" and (sysio.IsFileExists)(l_0_0) then
  (bm.add_related_file)(l_0_0)
end
return mp.INFECTED

