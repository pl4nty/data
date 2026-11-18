-- Threat: !InfrastructureShared
-- Name: 95d70d0ec9b6
-- Type: 21
-- Includes: ResearchData

local l_0_0 = sysio.RegExpandUserKey("HKCU\\SOFTWARE\\Microsoft\\Windows\\Shell\\Associations\\UrlAssociations\\ms-windows-store\\UserChoice")
if l_0_0 then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if string.find(string.lower(l_0_2), "hkcu@s-1-5-21-", 1, true) then
      local l_0_3 = sysio.RegOpenKey(l_0_2)
      if l_0_3 then
        local l_0_4 = sysio.GetRegValueAsString(l_0_3, "ProgId")
        if l_0_4 then
          local l_0_5 = string.match(l_0_2, "(HKCU.-)\\")
          if l_0_5 then
            local l_0_6 = l_0_5 .. "\\Software\\Classes\\" .. l_0_4 .. "\\shell\\open\\command"
            local l_0_7 = sysio.RegOpenKey(l_0_6)
            if l_0_7 then
              local l_0_8 = sysio.GetRegValueAsString(l_0_7, "")
              if l_0_8 then
                if string.len(l_0_8) < 4 and string.lower(l_0_8) ~= "cmd" then
                  return mp.CLEAN
                end
                set_research_data("DefaultValue", l_0_8, false)
                local l_0_9 = mp.GetScannedPPID()
                local l_0_10 = {}
                table.insert(l_0_10, l_0_9)
                MpCommon.SetPersistContextNoPath("UACBypassRegSet.A", l_0_10, 5)
                mp.set_mpattribute("MpDisableCaching")
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
