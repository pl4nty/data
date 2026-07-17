-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3ba981b40\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    local l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p2)
    l_0_0 = (string.gsub)(l_0_0, "\"", "")
    l_0_0 = (string.gsub)(l_0_0, "%s+$", "")
    if (string.find)(l_0_0, "c:\\programdata\\", 1, true) or (string.find)(l_0_0, "\\appdata\\roaming\\", 1, true) or (string.find)(l_0_0, "\\appdata\\local\\", 1, true) then
      AppendToRollingQueue("Rugmigen_Parent", l_0_0, 1, 30)
    end
  end
  return mp.INFECTED
end

