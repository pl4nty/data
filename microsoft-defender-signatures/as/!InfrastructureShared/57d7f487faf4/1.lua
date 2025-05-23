-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\57d7f487faf4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = (string.gsub)((string.lower)(l_0_1), "[%\'\"]%)?%+%(?[%\'\"]", "")
if not (string.find)(l_0_1, "iex", 1, true) or not (string.find)(l_0_1, "iwr", 1, true) or not (string.find)(l_0_1, "hidden", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
do
  if l_0_2 ~= nil and l_0_2.image_path ~= nil then
    local l_0_3 = (string.lower)(l_0_2.image_path)
    if l_0_3:match("([^\\]+)$") == "explorer.exe" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

