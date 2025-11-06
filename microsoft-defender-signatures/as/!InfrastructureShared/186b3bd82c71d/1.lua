-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\186b3bd82c71d\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  if isnull(l_0_0) then
    return mp.CLEAN
  end
  local l_0_3 = nil
  local l_0_4 = {":\\perflogs\\", ":\\users\\all users\\", ":\\users\\default\\", ":\\users\\public\\", ":\\windows\\temp\\", "\\appdata\\local\\", "\\appdata\\roaming\\", "%appdata%", "%public%"}
  if contains(l_0_3, l_0_4) then
    if contains(l_0_3, {"\\Tools\\Sysinternals\\", "NETLOGON\\Tools", "AdminTools\\", "\\PSTools\\", "\\IT\\Tools\\", "\\Windows\\LTSvc\\packages", "fastping"}) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

