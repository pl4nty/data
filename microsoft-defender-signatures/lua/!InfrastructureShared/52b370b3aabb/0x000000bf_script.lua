-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\52b370b3aabb\0x000000bf_luac 

-- params : ...
-- function num : 0
local l_0_0 = 0
local l_0_1 = ""
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_0 = (this_sigattrlog[1]).reg_new_value_size
  if l_0_0 > 10000 then
    l_0_1 = tohex((this_sigattrlog[1]).utf8p2)
    if (string.find)(l_0_1, "436F7079726967687420284329204D6963726F736F667420436F72706F726174696F6E2E0AE9", 1, true) then
      (bm.trigger_sig_delayed)("Behavior:Win32/RegsetShellbin.rescan", (this_sigattrlog[1]).utf8p1, 5000)
      ;
      (mp.TriggerScanResource)("file", "c:\\Windows\\Temp\\tmp8AB2.tmp", 0, 5000)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

