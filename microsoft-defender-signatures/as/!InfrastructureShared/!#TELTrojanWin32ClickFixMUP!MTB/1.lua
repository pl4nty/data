-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanWin32ClickFixMUP!MTB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = tostring(headerpage)
if l_0_0 ~= nil and ((string.lower)(l_0_0)):find("//dot.net/", 1, true) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if not l_0_1.image_path then
  do
    local l_0_2 = (string.lower)(l_0_1 == nil or "")
    if l_0_2:find("\\copilot.exe", 1, true) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end

