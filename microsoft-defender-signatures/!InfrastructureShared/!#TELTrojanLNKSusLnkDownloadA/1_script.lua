-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanLNKSusLnkDownloadA\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetLnkInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
do
  local l_0_1, l_0_2, l_0_3, l_0_4 = l_0_0.RelativePath or nil
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  if not contains(l_0_1, "..\\..\\") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  if not StringEndsWith(l_0_1, "\\cmd.exe") and not StringEndsWith(l_0_1, "\\powershell.exe") then
    return mp.CLEAN
  end
  local l_0_5 = nil
  local l_0_6 = nil
  if (string.find)(l_0_6, "base64", 1, true) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

