-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\96b3e93a7298\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_3 = (this_sigattrlog[2]).utf8p2
    local l_0_4 = {":\\perflogs\\", ":\\users\\all users\\", ":\\users\\default\\", ":\\users\\public\\", ":\\windows\\temp\\", "\\appdata\\local\\", "\\appdata\\roaming\\", "%appdata%", "%public%"}
    if contains(l_0_3, {"/create /tn tvinstallrestore /tr", "kontur.dostup abonent updater", "utorrent", ".xml", "retoolclient", "fastping"}) then
      return mp.CLEAN
    end
    if contains(l_0_3, l_0_4) then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

