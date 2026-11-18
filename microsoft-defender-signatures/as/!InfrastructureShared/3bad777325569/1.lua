-- Threat: !InfrastructureShared
-- Name: 3bad777325569
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) then
  local l_0_1 = string.lower(l_0_0.image_path or "")
  if string.find(l_0_1, "\\windows\\system32\\", 1, true) and (l_0_1:match("([^\\]+)$") == "fodhelper.exe" or l_0_1:match("([^\\]+)$") == "computerdefaults.exe" or l_0_1:match("([^\\]+)$") == "wsreset.exe" or l_0_1:match("([^\\]+)$") == "changepk.exe" or l_0_1:match("([^\\]+)$") == "slui.exe" or l_0_1:match("([^\\]+)$") == "control.exe") and MpCommon.GetPersistContextCountNoPath("UACBypassRegSet.A") > 0 then
    local l_0_2 = MpCommon.GetPersistContextNoPath("UACBypassRegSet.A")
    if l_0_2 then
      for l_0_3, l_0_4 in ipairs(l_0_2) do
        if string.lower(l_0_4) == string.lower(l_0_0.ppid) then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
