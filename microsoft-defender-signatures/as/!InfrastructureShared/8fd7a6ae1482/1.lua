-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8fd7a6ae1482\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "explorer.exe" then
    local l_0_2 = (mp.GetScannedPPID)()
    local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
    if l_0_3 == nil then
      return mp.CLEAN
    end
    l_0_3 = l_0_3:lower()
    l_0_3 = l_0_3:gsub("%^", "")
    l_0_3 = l_0_3:gsub("\'", "")
    l_0_3 = l_0_3:gsub("%s+", " ")
    if not (string.find)(l_0_3, "=powershell ", 1, true) and not (string.find)(l_0_3, "=curl ", 1, true) and not (string.find)(l_0_3, "set%s+%w+=%a*power") and not (string.find)(l_0_3, "set%s+%w+=%a*shell") and not (string.find)(l_0_3, "set%s+%w+=%a*curl") then
      return mp.CLEAN
    end
    if 0 + select(2, l_0_3:gsub("& call set ", "")) + select(2, l_0_3:gsub("& set ", "")) >= 4 then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

