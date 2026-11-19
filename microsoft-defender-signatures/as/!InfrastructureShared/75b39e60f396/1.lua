-- Threat: !InfrastructureShared
-- Name: 75b39e60f396
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p1
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 and l_0_1.integrity_level < MpCommon.SECURITY_MANDATORY_HIGH_RID then
  local l_0_2 = bm.get_imagepath()
  if l_0_2 then
    l_0_2 = string.lower(MpCommon.PathToWin32Path(l_0_2))
    if l_0_2 and (not mp.IsKnownFriendlyFile(l_0_2, false, false) or string.sub(l_0_2, -15) == "\\powershell.exe" or string.sub(l_0_2, -8) == "\\cmd.exe") then
      local l_0_3 = sysio.QuerySymbolicLinkObject("\\??\\globalroot\\device\\SystemPartition")
      if l_0_3 then
        local l_0_4 = string.sub(l_0_0, 1, -5)
        local l_0_5 = sysio.GetObjectDir(l_0_4)
        if l_0_5 then
          for l_0_6, l_0_7 in pairs(l_0_5) do
            if string.find(l_0_6, "Partition", 1, true) then
              local l_0_8 = sysio.QuerySymbolicLinkObject(l_0_4 .. "\\" .. l_0_6)
              if l_0_8 == l_0_3 then
                return mp.INFECTED
              end
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
