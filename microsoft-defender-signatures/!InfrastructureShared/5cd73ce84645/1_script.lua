-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5cd73ce84645\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 then
  local l_0_1 = l_0_0.image_path
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)((MpCommon.PathToWin32Path)(l_0_1))
  local l_0_2 = StringSplit(l_0_1, "\\")
  if #l_0_2 < 7 then
    return mp.CLEAN
  end
  local l_0_3 = {}
  l_0_3["cmd.exe"] = true
  l_0_3["powershell.exe"] = true
  if l_0_3[l_0_2[#l_0_2]] then
    return mp.CLEAN
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

