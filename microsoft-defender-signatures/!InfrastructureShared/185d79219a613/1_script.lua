-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\185d79219a613\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not l_0_0.image_path then
  do
    local l_0_1 = (string.lower)(isnull(l_0_0) or "")
    if (string.find)(l_0_1, "\\windows\\system32\\", 1, true) and (l_0_1:match("([^\\]+)$") == "fodhelper.exe" or l_0_1:match("([^\\]+)$") == "computerdefaults.exe" or l_0_1:match("([^\\]+)$") == "wsreset.exe" or l_0_1:match("([^\\]+)$") == "slui.exe" or l_0_1:match("([^\\]+)$") == "changepk.exe" or l_0_1:match("([^\\]+)$") == "control.exe" or l_0_1:match("([^\\]+)$") == "compmgmtlauncher.exe") then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

