-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69b3d8e956f3\0x000012d4_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
  local l_0_0 = (this_sigattrlog[3]).utf8p2
  l_0_0 = (string.gsub)(l_0_0, "\"", "")
  l_0_0 = (string.gsub)(l_0_0, "%s+$", "")
  if (sysio.IsFileExists)(l_0_0) then
    if (mp.IsKnownFriendlyFile)(l_0_0, true, false) == false then
      AppendToRollingQueue("Rugmigen_Parent", l_0_0, 1, 30)
      ;
      (bm.add_threat_file)(l_0_0)
    else
      local l_0_1 = (string.lower)(l_0_0)
      if (string.find)(l_0_1, "c:\\users\\", 1, true) or (string.find)(l_0_1, "c:\\programdata\\", 1, true) or (string.find)(l_0_1, "\\kmspico\\", 1, true) then
        AppendToRollingQueue("Rugmigen_Parent", l_0_0, 1, 30)
        ;
        (bm.add_threat_file)(l_0_0)
      end
    end
  end
  do
    do
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

