-- Threat: !InfrastructureShared
-- Name: 9fd7d447af85
-- Type: 21
-- Includes: ResearchData

local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Classes\\Ms-Settings\\Shell\\Open\\Command")
if l_0_0 then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if string.find(string.lower(l_0_2), "hkcu@s-1-5-21-", 1, true) then
      local l_0_3 = sysio.RegOpenKey(l_0_2)
      if l_0_3 then
        local l_0_4 = sysio.GetRegValueAsString(l_0_3, "")
        if l_0_4 then
          if string.len(l_0_4) < 4 and string.lower(l_0_4) ~= "cmd" then
            return mp.CLEAN
          end
          set_research_data("DefaultValue", l_0_4, false)
          local l_0_5 = mp.GetScannedPPID()
          local l_0_6 = {}
          table.insert(l_0_6, l_0_5)
          MpCommon.SetPersistContextNoPath("UACBypassRegSet.A", l_0_6, 5)
          mp.set_mpattribute("MpDisableCaching")
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
