-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a300_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 ~= nil and (MpCommon.StringRegExpSearch)("[u0010-u00ff][u0100-uffff][u0010-u00ff]", l_0_1) == true then
  local l_0_2 = (mp.GetParentProcInfo)()
  if l_0_2 ~= nil then
    local l_0_3 = (string.lower)(l_0_2.image_path)
    if l_0_3 ~= nil and (string.find)(l_0_3, "explorer.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

